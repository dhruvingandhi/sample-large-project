# Explore: explore_2310
# Auto-generated LookML Explore File

include: "/views/domain_31/view_06931.view.lkml"
include: "/views/domain_33/view_06933.view.lkml"
include: "/views/domain_34/view_06934.view.lkml"
include: "/views/domain_35/view_06935.view.lkml"

explore: explore_2310 {
  label: "Explore Explore 2310"
  description: "Comprehensive analytics explore joining base view_06931 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06931
  
  always_filter: {
    filters: [view_06931.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06931.created_at_date: "7 days"]
    unless: [view_06931.id, view_06931.status]
  }

  join: view_06933 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06931.user_id} = ${view_06933.id} ;;
    required_joins: []
  }

  join: view_06934 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06931.account_id} = ${view_06934.account_id} ;;
    required_joins: [view_06933]
  }

  join: view_06935 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06931.category} = ${view_06935.category} ;;
  }

  access_filter: {
    field: view_06931.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06931.is_deleted} = false ;;
}
