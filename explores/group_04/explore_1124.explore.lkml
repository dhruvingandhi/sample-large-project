# Explore: explore_1124
# Auto-generated LookML Explore File

include: "/views/domain_23/view_03373.view.lkml"
include: "/views/domain_25/view_03375.view.lkml"
include: "/views/domain_26/view_03376.view.lkml"
include: "/views/domain_27/view_03377.view.lkml"

explore: explore_1124 {
  label: "Explore Explore 1124"
  description: "Comprehensive analytics explore joining base view_03373 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03373
  
  always_filter: {
    filters: [view_03373.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03373.created_at_date: "7 days"]
    unless: [view_03373.id, view_03373.status]
  }

  join: view_03375 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03373.user_id} = ${view_03375.id} ;;
    required_joins: []
  }

  join: view_03376 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03373.account_id} = ${view_03376.account_id} ;;
    required_joins: [view_03375]
  }

  join: view_03377 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03373.category} = ${view_03377.category} ;;
  }

  access_filter: {
    field: view_03373.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03373.is_deleted} = false ;;
}
