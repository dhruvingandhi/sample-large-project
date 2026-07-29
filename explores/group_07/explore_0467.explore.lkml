# Explore: explore_0467
# Auto-generated LookML Explore File

include: "/views/domain_02/view_01402.view.lkml"
include: "/views/domain_04/view_01404.view.lkml"
include: "/views/domain_05/view_01405.view.lkml"
include: "/views/domain_06/view_01406.view.lkml"

explore: explore_0467 {
  label: "Explore Explore 0467"
  description: "Comprehensive analytics explore joining base view_01402 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01402
  
  always_filter: {
    filters: [view_01402.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01402.created_at_date: "7 days"]
    unless: [view_01402.id, view_01402.status]
  }

  join: view_01404 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01402.user_id} = ${view_01404.id} ;;
    required_joins: []
  }

  join: view_01405 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01402.account_id} = ${view_01405.account_id} ;;
    required_joins: [view_01404]
  }

  join: view_01406 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01402.category} = ${view_01406.category} ;;
  }

  access_filter: {
    field: view_01402.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01402.is_deleted} = false ;;
}
