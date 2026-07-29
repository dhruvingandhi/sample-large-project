# Explore: explore_3705
# Auto-generated LookML Explore File

include: "/views/domain_16/view_11116.view.lkml"
include: "/views/domain_18/view_11118.view.lkml"
include: "/views/domain_19/view_11119.view.lkml"
include: "/views/domain_20/view_11120.view.lkml"

explore: explore_3705 {
  label: "Explore Explore 3705"
  description: "Comprehensive analytics explore joining base view_11116 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11116
  
  always_filter: {
    filters: [view_11116.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11116.created_at_date: "7 days"]
    unless: [view_11116.id, view_11116.status]
  }

  join: view_11118 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11116.user_id} = ${view_11118.id} ;;
    required_joins: []
  }

  join: view_11119 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11116.account_id} = ${view_11119.account_id} ;;
    required_joins: [view_11118]
  }

  join: view_11120 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11116.category} = ${view_11120.category} ;;
  }

  access_filter: {
    field: view_11116.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11116.is_deleted} = false ;;
}
