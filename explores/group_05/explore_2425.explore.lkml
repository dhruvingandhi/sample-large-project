# Explore: explore_2425
# Auto-generated LookML Explore File

include: "/views/domain_26/view_07276.view.lkml"
include: "/views/domain_28/view_07278.view.lkml"
include: "/views/domain_29/view_07279.view.lkml"
include: "/views/domain_30/view_07280.view.lkml"

explore: explore_2425 {
  label: "Explore Explore 2425"
  description: "Comprehensive analytics explore joining base view_07276 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_07276
  
  always_filter: {
    filters: [view_07276.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07276.created_at_date: "7 days"]
    unless: [view_07276.id, view_07276.status]
  }

  join: view_07278 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07276.user_id} = ${view_07278.id} ;;
    required_joins: []
  }

  join: view_07279 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07276.account_id} = ${view_07279.account_id} ;;
    required_joins: [view_07278]
  }

  join: view_07280 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07276.category} = ${view_07280.category} ;;
  }

  access_filter: {
    field: view_07276.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07276.is_deleted} = false ;;
}
