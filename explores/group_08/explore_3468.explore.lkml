# Explore: explore_3468
# Auto-generated LookML Explore File

include: "/views/domain_05/view_10405.view.lkml"
include: "/views/domain_07/view_10407.view.lkml"
include: "/views/domain_08/view_10408.view.lkml"
include: "/views/domain_09/view_10409.view.lkml"

explore: explore_3468 {
  label: "Explore Explore 3468"
  description: "Comprehensive analytics explore joining base view_10405 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10405
  
  always_filter: {
    filters: [view_10405.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10405.created_at_date: "7 days"]
    unless: [view_10405.id, view_10405.status]
  }

  join: view_10407 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10405.user_id} = ${view_10407.id} ;;
    required_joins: []
  }

  join: view_10408 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10405.account_id} = ${view_10408.account_id} ;;
    required_joins: [view_10407]
  }

  join: view_10409 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10405.category} = ${view_10409.category} ;;
  }

  access_filter: {
    field: view_10405.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10405.is_deleted} = false ;;
}
