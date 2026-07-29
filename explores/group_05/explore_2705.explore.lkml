# Explore: explore_2705
# Auto-generated LookML Explore File

include: "/views/domain_16/view_08116.view.lkml"
include: "/views/domain_18/view_08118.view.lkml"
include: "/views/domain_19/view_08119.view.lkml"
include: "/views/domain_20/view_08120.view.lkml"

explore: explore_2705 {
  label: "Explore Explore 2705"
  description: "Comprehensive analytics explore joining base view_08116 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08116
  
  always_filter: {
    filters: [view_08116.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08116.created_at_date: "7 days"]
    unless: [view_08116.id, view_08116.status]
  }

  join: view_08118 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08116.user_id} = ${view_08118.id} ;;
    required_joins: []
  }

  join: view_08119 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08116.account_id} = ${view_08119.account_id} ;;
    required_joins: [view_08118]
  }

  join: view_08120 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08116.category} = ${view_08120.category} ;;
  }

  access_filter: {
    field: view_08116.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08116.is_deleted} = false ;;
}
