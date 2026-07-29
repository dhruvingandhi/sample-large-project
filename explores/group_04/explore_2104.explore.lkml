# Explore: explore_2104
# Auto-generated LookML Explore File

include: "/views/domain_13/view_06313.view.lkml"
include: "/views/domain_15/view_06315.view.lkml"
include: "/views/domain_16/view_06316.view.lkml"
include: "/views/domain_17/view_06317.view.lkml"

explore: explore_2104 {
  label: "Explore Explore 2104"
  description: "Comprehensive analytics explore joining base view_06313 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06313
  
  always_filter: {
    filters: [view_06313.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06313.created_at_date: "7 days"]
    unless: [view_06313.id, view_06313.status]
  }

  join: view_06315 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06313.user_id} = ${view_06315.id} ;;
    required_joins: []
  }

  join: view_06316 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06313.account_id} = ${view_06316.account_id} ;;
    required_joins: [view_06315]
  }

  join: view_06317 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06313.category} = ${view_06317.category} ;;
  }

  access_filter: {
    field: view_06313.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06313.is_deleted} = false ;;
}
