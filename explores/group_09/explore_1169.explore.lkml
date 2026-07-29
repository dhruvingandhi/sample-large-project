# Explore: explore_1169
# Auto-generated LookML Explore File

include: "/views/domain_08/view_03508.view.lkml"
include: "/views/domain_10/view_03510.view.lkml"
include: "/views/domain_11/view_03511.view.lkml"
include: "/views/domain_12/view_03512.view.lkml"

explore: explore_1169 {
  label: "Explore Explore 1169"
  description: "Comprehensive analytics explore joining base view_03508 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03508
  
  always_filter: {
    filters: [view_03508.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03508.created_at_date: "7 days"]
    unless: [view_03508.id, view_03508.status]
  }

  join: view_03510 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03508.user_id} = ${view_03510.id} ;;
    required_joins: []
  }

  join: view_03511 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03508.account_id} = ${view_03511.account_id} ;;
    required_joins: [view_03510]
  }

  join: view_03512 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03508.category} = ${view_03512.category} ;;
  }

  access_filter: {
    field: view_03508.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03508.is_deleted} = false ;;
}
