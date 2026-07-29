# Explore: explore_1468
# Auto-generated LookML Explore File

include: "/views/domain_05/view_04405.view.lkml"
include: "/views/domain_07/view_04407.view.lkml"
include: "/views/domain_08/view_04408.view.lkml"
include: "/views/domain_09/view_04409.view.lkml"

explore: explore_1468 {
  label: "Explore Explore 1468"
  description: "Comprehensive analytics explore joining base view_04405 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04405
  
  always_filter: {
    filters: [view_04405.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04405.created_at_date: "7 days"]
    unless: [view_04405.id, view_04405.status]
  }

  join: view_04407 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04405.user_id} = ${view_04407.id} ;;
    required_joins: []
  }

  join: view_04408 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04405.account_id} = ${view_04408.account_id} ;;
    required_joins: [view_04407]
  }

  join: view_04409 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04405.category} = ${view_04409.category} ;;
  }

  access_filter: {
    field: view_04405.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04405.is_deleted} = false ;;
}
