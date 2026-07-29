# Explore: explore_1802
# Auto-generated LookML Explore File

include: "/views/domain_07/view_05407.view.lkml"
include: "/views/domain_09/view_05409.view.lkml"
include: "/views/domain_10/view_05410.view.lkml"
include: "/views/domain_11/view_05411.view.lkml"

explore: explore_1802 {
  label: "Explore Explore 1802"
  description: "Comprehensive analytics explore joining base view_05407 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05407
  
  always_filter: {
    filters: [view_05407.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05407.created_at_date: "7 days"]
    unless: [view_05407.id, view_05407.status]
  }

  join: view_05409 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05407.user_id} = ${view_05409.id} ;;
    required_joins: []
  }

  join: view_05410 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05407.account_id} = ${view_05410.account_id} ;;
    required_joins: [view_05409]
  }

  join: view_05411 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05407.category} = ${view_05411.category} ;;
  }

  access_filter: {
    field: view_05407.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05407.is_deleted} = false ;;
}
