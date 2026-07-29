# Explore: explore_2422
# Auto-generated LookML Explore File

include: "/views/domain_17/view_07267.view.lkml"
include: "/views/domain_19/view_07269.view.lkml"
include: "/views/domain_20/view_07270.view.lkml"
include: "/views/domain_21/view_07271.view.lkml"

explore: explore_2422 {
  label: "Explore Explore 2422"
  description: "Comprehensive analytics explore joining base view_07267 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07267
  
  always_filter: {
    filters: [view_07267.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07267.created_at_date: "7 days"]
    unless: [view_07267.id, view_07267.status]
  }

  join: view_07269 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07267.user_id} = ${view_07269.id} ;;
    required_joins: []
  }

  join: view_07270 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07267.account_id} = ${view_07270.account_id} ;;
    required_joins: [view_07269]
  }

  join: view_07271 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07267.category} = ${view_07271.category} ;;
  }

  access_filter: {
    field: view_07267.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07267.is_deleted} = false ;;
}
