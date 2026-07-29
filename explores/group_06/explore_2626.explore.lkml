# Explore: explore_2626
# Auto-generated LookML Explore File

include: "/views/domain_29/view_07879.view.lkml"
include: "/views/domain_31/view_07881.view.lkml"
include: "/views/domain_32/view_07882.view.lkml"
include: "/views/domain_33/view_07883.view.lkml"

explore: explore_2626 {
  label: "Explore Explore 2626"
  description: "Comprehensive analytics explore joining base view_07879 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07879
  
  always_filter: {
    filters: [view_07879.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07879.created_at_date: "7 days"]
    unless: [view_07879.id, view_07879.status]
  }

  join: view_07881 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07879.user_id} = ${view_07881.id} ;;
    required_joins: []
  }

  join: view_07882 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07879.account_id} = ${view_07882.account_id} ;;
    required_joins: [view_07881]
  }

  join: view_07883 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07879.category} = ${view_07883.category} ;;
  }

  access_filter: {
    field: view_07879.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07879.is_deleted} = false ;;
}
