# Explore: explore_1768
# Auto-generated LookML Explore File

include: "/views/domain_05/view_05305.view.lkml"
include: "/views/domain_07/view_05307.view.lkml"
include: "/views/domain_08/view_05308.view.lkml"
include: "/views/domain_09/view_05309.view.lkml"

explore: explore_1768 {
  label: "Explore Explore 1768"
  description: "Comprehensive analytics explore joining base view_05305 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05305
  
  always_filter: {
    filters: [view_05305.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05305.created_at_date: "7 days"]
    unless: [view_05305.id, view_05305.status]
  }

  join: view_05307 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05305.user_id} = ${view_05307.id} ;;
    required_joins: []
  }

  join: view_05308 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05305.account_id} = ${view_05308.account_id} ;;
    required_joins: [view_05307]
  }

  join: view_05309 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05305.category} = ${view_05309.category} ;;
  }

  access_filter: {
    field: view_05305.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05305.is_deleted} = false ;;
}
