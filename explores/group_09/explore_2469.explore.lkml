# Explore: explore_2469
# Auto-generated LookML Explore File

include: "/views/domain_08/view_07408.view.lkml"
include: "/views/domain_10/view_07410.view.lkml"
include: "/views/domain_11/view_07411.view.lkml"
include: "/views/domain_12/view_07412.view.lkml"

explore: explore_2469 {
  label: "Explore Explore 2469"
  description: "Comprehensive analytics explore joining base view_07408 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07408
  
  always_filter: {
    filters: [view_07408.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07408.created_at_date: "7 days"]
    unless: [view_07408.id, view_07408.status]
  }

  join: view_07410 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07408.user_id} = ${view_07410.id} ;;
    required_joins: []
  }

  join: view_07411 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07408.account_id} = ${view_07411.account_id} ;;
    required_joins: [view_07410]
  }

  join: view_07412 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07408.category} = ${view_07412.category} ;;
  }

  access_filter: {
    field: view_07408.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07408.is_deleted} = false ;;
}
