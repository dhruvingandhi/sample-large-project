# Explore: explore_0138
# Auto-generated LookML Explore File

include: "/views/domain_15/view_00415.view.lkml"
include: "/views/domain_17/view_00417.view.lkml"
include: "/views/domain_18/view_00418.view.lkml"
include: "/views/domain_19/view_00419.view.lkml"

explore: explore_0138 {
  label: "Explore Explore 0138"
  description: "Comprehensive analytics explore joining base view_00415 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00415
  
  always_filter: {
    filters: [view_00415.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00415.created_at_date: "7 days"]
    unless: [view_00415.id, view_00415.status]
  }

  join: view_00417 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00415.user_id} = ${view_00417.id} ;;
    required_joins: []
  }

  join: view_00418 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00415.account_id} = ${view_00418.account_id} ;;
    required_joins: [view_00417]
  }

  join: view_00419 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00415.category} = ${view_00419.category} ;;
  }

  access_filter: {
    field: view_00415.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00415.is_deleted} = false ;;
}
