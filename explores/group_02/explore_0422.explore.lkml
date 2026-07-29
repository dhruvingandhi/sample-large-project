# Explore: explore_0422
# Auto-generated LookML Explore File

include: "/views/domain_17/view_01267.view.lkml"
include: "/views/domain_19/view_01269.view.lkml"
include: "/views/domain_20/view_01270.view.lkml"
include: "/views/domain_21/view_01271.view.lkml"

explore: explore_0422 {
  label: "Explore Explore 0422"
  description: "Comprehensive analytics explore joining base view_01267 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01267
  
  always_filter: {
    filters: [view_01267.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01267.created_at_date: "7 days"]
    unless: [view_01267.id, view_01267.status]
  }

  join: view_01269 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01267.user_id} = ${view_01269.id} ;;
    required_joins: []
  }

  join: view_01270 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01267.account_id} = ${view_01270.account_id} ;;
    required_joins: [view_01269]
  }

  join: view_01271 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01267.category} = ${view_01271.category} ;;
  }

  access_filter: {
    field: view_01267.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01267.is_deleted} = false ;;
}
