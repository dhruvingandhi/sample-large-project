# Explore: explore_0626
# Auto-generated LookML Explore File

include: "/views/domain_29/view_01879.view.lkml"
include: "/views/domain_31/view_01881.view.lkml"
include: "/views/domain_32/view_01882.view.lkml"
include: "/views/domain_33/view_01883.view.lkml"

explore: explore_0626 {
  label: "Explore Explore 0626"
  description: "Comprehensive analytics explore joining base view_01879 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01879
  
  always_filter: {
    filters: [view_01879.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01879.created_at_date: "7 days"]
    unless: [view_01879.id, view_01879.status]
  }

  join: view_01881 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01879.user_id} = ${view_01881.id} ;;
    required_joins: []
  }

  join: view_01882 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01879.account_id} = ${view_01882.account_id} ;;
    required_joins: [view_01881]
  }

  join: view_01883 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01879.category} = ${view_01883.category} ;;
  }

  access_filter: {
    field: view_01879.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01879.is_deleted} = false ;;
}
