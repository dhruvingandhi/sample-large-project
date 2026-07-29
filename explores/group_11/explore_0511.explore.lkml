# Explore: explore_0511
# Auto-generated LookML Explore File

include: "/views/domain_34/view_01534.view.lkml"
include: "/views/domain_36/view_01536.view.lkml"
include: "/views/domain_37/view_01537.view.lkml"
include: "/views/domain_38/view_01538.view.lkml"

explore: explore_0511 {
  label: "Explore Explore 0511"
  description: "Comprehensive analytics explore joining base view_01534 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01534
  
  always_filter: {
    filters: [view_01534.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01534.created_at_date: "7 days"]
    unless: [view_01534.id, view_01534.status]
  }

  join: view_01536 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01534.user_id} = ${view_01536.id} ;;
    required_joins: []
  }

  join: view_01537 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01534.account_id} = ${view_01537.account_id} ;;
    required_joins: [view_01536]
  }

  join: view_01538 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01534.category} = ${view_01538.category} ;;
  }

  access_filter: {
    field: view_01534.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01534.is_deleted} = false ;;
}
