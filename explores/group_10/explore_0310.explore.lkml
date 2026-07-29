# Explore: explore_0310
# Auto-generated LookML Explore File

include: "/views/domain_31/view_00931.view.lkml"
include: "/views/domain_33/view_00933.view.lkml"
include: "/views/domain_34/view_00934.view.lkml"
include: "/views/domain_35/view_00935.view.lkml"

explore: explore_0310 {
  label: "Explore Explore 0310"
  description: "Comprehensive analytics explore joining base view_00931 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00931
  
  always_filter: {
    filters: [view_00931.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00931.created_at_date: "7 days"]
    unless: [view_00931.id, view_00931.status]
  }

  join: view_00933 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00931.user_id} = ${view_00933.id} ;;
    required_joins: []
  }

  join: view_00934 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00931.account_id} = ${view_00934.account_id} ;;
    required_joins: [view_00933]
  }

  join: view_00935 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00931.category} = ${view_00935.category} ;;
  }

  access_filter: {
    field: view_00931.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00931.is_deleted} = false ;;
}
