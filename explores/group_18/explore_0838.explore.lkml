# Update for 2000 file diff target
# Explore: explore_0838
# Auto-generated LookML Explore File

include: "/views/domain_15/view_02515.view.lkml"
include: "/views/domain_17/view_02517.view.lkml"
include: "/views/domain_18/view_02518.view.lkml"
include: "/views/domain_19/view_02519.view.lkml"

explore: explore_0838 {
  label: "Explore Explore 0838"
  description: "Comprehensive analytics explore joining base view_02515 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_02515
  
  always_filter: {
    filters: [view_02515.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02515.created_at_date: "7 days"]
    unless: [view_02515.id, view_02515.status]
  }

  join: view_02517 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02515.user_id} = ${view_02517.id} ;;
    required_joins: []
  }

  join: view_02518 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02515.account_id} = ${view_02518.account_id} ;;
    required_joins: [view_02517]
  }

  join: view_02519 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02515.category} = ${view_02519.category} ;;
  }

  access_filter: {
    field: view_02515.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02515.is_deleted} = false ;;
}
