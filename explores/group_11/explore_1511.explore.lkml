# Explore: explore_1511
# Auto-generated LookML Explore File

include: "/views/domain_34/view_04534.view.lkml"
include: "/views/domain_36/view_04536.view.lkml"
include: "/views/domain_37/view_04537.view.lkml"
include: "/views/domain_38/view_04538.view.lkml"

explore: explore_1511 {
  label: "Explore Explore 1511"
  description: "Comprehensive analytics explore joining base view_04534 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04534
  
  always_filter: {
    filters: [view_04534.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04534.created_at_date: "7 days"]
    unless: [view_04534.id, view_04534.status]
  }

  join: view_04536 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04534.user_id} = ${view_04536.id} ;;
    required_joins: []
  }

  join: view_04537 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04534.account_id} = ${view_04537.account_id} ;;
    required_joins: [view_04536]
  }

  join: view_04538 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04534.category} = ${view_04538.category} ;;
  }

  access_filter: {
    field: view_04534.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04534.is_deleted} = false ;;
}
