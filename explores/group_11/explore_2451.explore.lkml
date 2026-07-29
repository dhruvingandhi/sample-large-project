# Explore: explore_2451
# Auto-generated LookML Explore File

include: "/views/domain_04/view_07354.view.lkml"
include: "/views/domain_06/view_07356.view.lkml"
include: "/views/domain_07/view_07357.view.lkml"
include: "/views/domain_08/view_07358.view.lkml"

explore: explore_2451 {
  label: "Explore Explore 2451"
  description: "Comprehensive analytics explore joining base view_07354 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_07354
  
  always_filter: {
    filters: [view_07354.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07354.created_at_date: "7 days"]
    unless: [view_07354.id, view_07354.status]
  }

  join: view_07356 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07354.user_id} = ${view_07356.id} ;;
    required_joins: []
  }

  join: view_07357 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07354.account_id} = ${view_07357.account_id} ;;
    required_joins: [view_07356]
  }

  join: view_07358 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07354.category} = ${view_07358.category} ;;
  }

  access_filter: {
    field: view_07354.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07354.is_deleted} = false ;;
}
