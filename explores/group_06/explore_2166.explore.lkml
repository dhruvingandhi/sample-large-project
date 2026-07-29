# Explore: explore_2166
# Auto-generated LookML Explore File

include: "/views/domain_49/view_06499.view.lkml"
include: "/views/domain_01/view_06501.view.lkml"
include: "/views/domain_02/view_06502.view.lkml"
include: "/views/domain_03/view_06503.view.lkml"

explore: explore_2166 {
  label: "Explore Explore 2166"
  description: "Comprehensive analytics explore joining base view_06499 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06499
  
  always_filter: {
    filters: [view_06499.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06499.created_at_date: "7 days"]
    unless: [view_06499.id, view_06499.status]
  }

  join: view_06501 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06499.user_id} = ${view_06501.id} ;;
    required_joins: []
  }

  join: view_06502 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06499.account_id} = ${view_06502.account_id} ;;
    required_joins: [view_06501]
  }

  join: view_06503 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06499.category} = ${view_06503.category} ;;
  }

  access_filter: {
    field: view_06499.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06499.is_deleted} = false ;;
}
