# Explore: explore_0705
# Auto-generated LookML Explore File

include: "/views/domain_16/view_02116.view.lkml"
include: "/views/domain_18/view_02118.view.lkml"
include: "/views/domain_19/view_02119.view.lkml"
include: "/views/domain_20/view_02120.view.lkml"

explore: explore_0705 {
  label: "Explore Explore 0705"
  description: "Comprehensive analytics explore joining base view_02116 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_02116
  
  always_filter: {
    filters: [view_02116.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02116.created_at_date: "7 days"]
    unless: [view_02116.id, view_02116.status]
  }

  join: view_02118 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02116.user_id} = ${view_02118.id} ;;
    required_joins: []
  }

  join: view_02119 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02116.account_id} = ${view_02119.account_id} ;;
    required_joins: [view_02118]
  }

  join: view_02120 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02116.category} = ${view_02120.category} ;;
  }

  access_filter: {
    field: view_02116.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02116.is_deleted} = false ;;
}
