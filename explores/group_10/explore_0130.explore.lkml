# Update for 2000 file diff target
# Explore: explore_0130
# Auto-generated LookML Explore File

include: "/views/domain_41/view_00391.view.lkml"
include: "/views/domain_43/view_00393.view.lkml"
include: "/views/domain_44/view_00394.view.lkml"
include: "/views/domain_45/view_00395.view.lkml"

explore: explore_0130 {
  label: "Explore Explore 0130"
  description: "Comprehensive analytics explore joining base view_00391 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00391
  
  always_filter: {
    filters: [view_00391.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00391.created_at_date: "7 days"]
    unless: [view_00391.id, view_00391.status]
  }

  join: view_00393 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00391.user_id} = ${view_00393.id} ;;
    required_joins: []
  }

  join: view_00394 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00391.account_id} = ${view_00394.account_id} ;;
    required_joins: [view_00393]
  }

  join: view_00395 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00391.category} = ${view_00395.category} ;;
  }

  access_filter: {
    field: view_00391.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00391.is_deleted} = false ;;
}
