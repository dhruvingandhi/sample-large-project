# Explore: explore_2511
# Auto-generated LookML Explore File

include: "/views/domain_34/view_07534.view.lkml"
include: "/views/domain_36/view_07536.view.lkml"
include: "/views/domain_37/view_07537.view.lkml"
include: "/views/domain_38/view_07538.view.lkml"

explore: explore_2511 {
  label: "Explore Explore 2511"
  description: "Comprehensive analytics explore joining base view_07534 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07534
  
  always_filter: {
    filters: [view_07534.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07534.created_at_date: "7 days"]
    unless: [view_07534.id, view_07534.status]
  }

  join: view_07536 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07534.user_id} = ${view_07536.id} ;;
    required_joins: []
  }

  join: view_07537 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07534.account_id} = ${view_07537.account_id} ;;
    required_joins: [view_07536]
  }

  join: view_07538 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07534.category} = ${view_07538.category} ;;
  }

  access_filter: {
    field: view_07534.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07534.is_deleted} = false ;;
}
