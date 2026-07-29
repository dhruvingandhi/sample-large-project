# Explore: explore_1976
# Auto-generated LookML Explore File

include: "/views/domain_29/view_05929.view.lkml"
include: "/views/domain_31/view_05931.view.lkml"
include: "/views/domain_32/view_05932.view.lkml"
include: "/views/domain_33/view_05933.view.lkml"

explore: explore_1976 {
  label: "Explore Explore 1976"
  description: "Comprehensive analytics explore joining base view_05929 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05929
  
  always_filter: {
    filters: [view_05929.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05929.created_at_date: "7 days"]
    unless: [view_05929.id, view_05929.status]
  }

  join: view_05931 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05929.user_id} = ${view_05931.id} ;;
    required_joins: []
  }

  join: view_05932 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05929.account_id} = ${view_05932.account_id} ;;
    required_joins: [view_05931]
  }

  join: view_05933 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05929.category} = ${view_05933.category} ;;
  }

  access_filter: {
    field: view_05929.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05929.is_deleted} = false ;;
}
