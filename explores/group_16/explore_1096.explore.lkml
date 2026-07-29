# Explore: explore_1096
# Auto-generated LookML Explore File

include: "/views/domain_39/view_03289.view.lkml"
include: "/views/domain_41/view_03291.view.lkml"
include: "/views/domain_42/view_03292.view.lkml"
include: "/views/domain_43/view_03293.view.lkml"

explore: explore_1096 {
  label: "Explore Explore 1096"
  description: "Comprehensive analytics explore joining base view_03289 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03289
  
  always_filter: {
    filters: [view_03289.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03289.created_at_date: "7 days"]
    unless: [view_03289.id, view_03289.status]
  }

  join: view_03291 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03289.user_id} = ${view_03291.id} ;;
    required_joins: []
  }

  join: view_03292 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03289.account_id} = ${view_03292.account_id} ;;
    required_joins: [view_03291]
  }

  join: view_03293 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03289.category} = ${view_03293.category} ;;
  }

  access_filter: {
    field: view_03289.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03289.is_deleted} = false ;;
}
