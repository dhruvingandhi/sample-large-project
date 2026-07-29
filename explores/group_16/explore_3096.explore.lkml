# Explore: explore_3096
# Auto-generated LookML Explore File

include: "/views/domain_39/view_09289.view.lkml"
include: "/views/domain_41/view_09291.view.lkml"
include: "/views/domain_42/view_09292.view.lkml"
include: "/views/domain_43/view_09293.view.lkml"

explore: explore_3096 {
  label: "Explore Explore 3096"
  description: "Comprehensive analytics explore joining base view_09289 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09289
  
  always_filter: {
    filters: [view_09289.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09289.created_at_date: "7 days"]
    unless: [view_09289.id, view_09289.status]
  }

  join: view_09291 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09289.user_id} = ${view_09291.id} ;;
    required_joins: []
  }

  join: view_09292 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09289.account_id} = ${view_09292.account_id} ;;
    required_joins: [view_09291]
  }

  join: view_09293 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09289.category} = ${view_09293.category} ;;
  }

  access_filter: {
    field: view_09289.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09289.is_deleted} = false ;;
}
