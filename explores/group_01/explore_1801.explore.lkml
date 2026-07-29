# Explore: explore_1801
# Auto-generated LookML Explore File

include: "/views/domain_04/view_05404.view.lkml"
include: "/views/domain_06/view_05406.view.lkml"
include: "/views/domain_07/view_05407.view.lkml"
include: "/views/domain_08/view_05408.view.lkml"

explore: explore_1801 {
  label: "Explore Explore 1801"
  description: "Comprehensive analytics explore joining base view_05404 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05404
  
  always_filter: {
    filters: [view_05404.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05404.created_at_date: "7 days"]
    unless: [view_05404.id, view_05404.status]
  }

  join: view_05406 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05404.user_id} = ${view_05406.id} ;;
    required_joins: []
  }

  join: view_05407 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05404.account_id} = ${view_05407.account_id} ;;
    required_joins: [view_05406]
  }

  join: view_05408 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05404.category} = ${view_05408.category} ;;
  }

  access_filter: {
    field: view_05404.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05404.is_deleted} = false ;;
}
