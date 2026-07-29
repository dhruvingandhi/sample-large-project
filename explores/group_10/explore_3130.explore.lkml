# Explore: explore_3130
# Auto-generated LookML Explore File

include: "/views/domain_41/view_09391.view.lkml"
include: "/views/domain_43/view_09393.view.lkml"
include: "/views/domain_44/view_09394.view.lkml"
include: "/views/domain_45/view_09395.view.lkml"

explore: explore_3130 {
  label: "Explore Explore 3130"
  description: "Comprehensive analytics explore joining base view_09391 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09391
  
  always_filter: {
    filters: [view_09391.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09391.created_at_date: "7 days"]
    unless: [view_09391.id, view_09391.status]
  }

  join: view_09393 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09391.user_id} = ${view_09393.id} ;;
    required_joins: []
  }

  join: view_09394 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09391.account_id} = ${view_09394.account_id} ;;
    required_joins: [view_09393]
  }

  join: view_09395 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09391.category} = ${view_09395.category} ;;
  }

  access_filter: {
    field: view_09391.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09391.is_deleted} = false ;;
}
