# Explore: explore_0434
# Auto-generated LookML Explore File

include: "/views/domain_03/view_01303.view.lkml"
include: "/views/domain_05/view_01305.view.lkml"
include: "/views/domain_06/view_01306.view.lkml"
include: "/views/domain_07/view_01307.view.lkml"

explore: explore_0434 {
  label: "Explore Explore 0434"
  description: "Comprehensive analytics explore joining base view_01303 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01303
  
  always_filter: {
    filters: [view_01303.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01303.created_at_date: "7 days"]
    unless: [view_01303.id, view_01303.status]
  }

  join: view_01305 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01303.user_id} = ${view_01305.id} ;;
    required_joins: []
  }

  join: view_01306 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01303.account_id} = ${view_01306.account_id} ;;
    required_joins: [view_01305]
  }

  join: view_01307 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01303.category} = ${view_01307.category} ;;
  }

  access_filter: {
    field: view_01303.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01303.is_deleted} = false ;;
}
