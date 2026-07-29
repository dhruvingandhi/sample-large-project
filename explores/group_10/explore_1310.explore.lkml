# Explore: explore_1310
# Auto-generated LookML Explore File

include: "/views/domain_31/view_03931.view.lkml"
include: "/views/domain_33/view_03933.view.lkml"
include: "/views/domain_34/view_03934.view.lkml"
include: "/views/domain_35/view_03935.view.lkml"

explore: explore_1310 {
  label: "Explore Explore 1310"
  description: "Comprehensive analytics explore joining base view_03931 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03931
  
  always_filter: {
    filters: [view_03931.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03931.created_at_date: "7 days"]
    unless: [view_03931.id, view_03931.status]
  }

  join: view_03933 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03931.user_id} = ${view_03933.id} ;;
    required_joins: []
  }

  join: view_03934 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03931.account_id} = ${view_03934.account_id} ;;
    required_joins: [view_03933]
  }

  join: view_03935 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03931.category} = ${view_03935.category} ;;
  }

  access_filter: {
    field: view_03931.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03931.is_deleted} = false ;;
}
