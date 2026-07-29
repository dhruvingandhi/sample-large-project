# Explore: explore_1885
# Auto-generated LookML Explore File

include: "/views/domain_06/view_05656.view.lkml"
include: "/views/domain_08/view_05658.view.lkml"
include: "/views/domain_09/view_05659.view.lkml"
include: "/views/domain_10/view_05660.view.lkml"

explore: explore_1885 {
  label: "Explore Explore 1885"
  description: "Comprehensive analytics explore joining base view_05656 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05656
  
  always_filter: {
    filters: [view_05656.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05656.created_at_date: "7 days"]
    unless: [view_05656.id, view_05656.status]
  }

  join: view_05658 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05656.user_id} = ${view_05658.id} ;;
    required_joins: []
  }

  join: view_05659 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05656.account_id} = ${view_05659.account_id} ;;
    required_joins: [view_05658]
  }

  join: view_05660 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05656.category} = ${view_05660.category} ;;
  }

  access_filter: {
    field: view_05656.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05656.is_deleted} = false ;;
}
