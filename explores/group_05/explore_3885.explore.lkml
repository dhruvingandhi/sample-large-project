# Explore: explore_3885
# Auto-generated LookML Explore File

include: "/views/domain_06/view_11656.view.lkml"
include: "/views/domain_08/view_11658.view.lkml"
include: "/views/domain_09/view_11659.view.lkml"
include: "/views/domain_10/view_11660.view.lkml"

explore: explore_3885 {
  label: "Explore Explore 3885"
  description: "Comprehensive analytics explore joining base view_11656 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11656
  
  always_filter: {
    filters: [view_11656.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11656.created_at_date: "7 days"]
    unless: [view_11656.id, view_11656.status]
  }

  join: view_11658 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11656.user_id} = ${view_11658.id} ;;
    required_joins: []
  }

  join: view_11659 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11656.account_id} = ${view_11659.account_id} ;;
    required_joins: [view_11658]
  }

  join: view_11660 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11656.category} = ${view_11660.category} ;;
  }

  access_filter: {
    field: view_11656.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11656.is_deleted} = false ;;
}
