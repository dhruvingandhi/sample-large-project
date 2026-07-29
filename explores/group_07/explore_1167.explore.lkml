# Explore: explore_1167
# Auto-generated LookML Explore File

include: "/views/domain_02/view_03502.view.lkml"
include: "/views/domain_04/view_03504.view.lkml"
include: "/views/domain_05/view_03505.view.lkml"
include: "/views/domain_06/view_03506.view.lkml"

explore: explore_1167 {
  label: "Explore Explore 1167"
  description: "Comprehensive analytics explore joining base view_03502 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03502
  
  always_filter: {
    filters: [view_03502.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03502.created_at_date: "7 days"]
    unless: [view_03502.id, view_03502.status]
  }

  join: view_03504 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03502.user_id} = ${view_03504.id} ;;
    required_joins: []
  }

  join: view_03505 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03502.account_id} = ${view_03505.account_id} ;;
    required_joins: [view_03504]
  }

  join: view_03506 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03502.category} = ${view_03506.category} ;;
  }

  access_filter: {
    field: view_03502.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03502.is_deleted} = false ;;
}
