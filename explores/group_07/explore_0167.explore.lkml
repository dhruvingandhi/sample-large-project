# Explore: explore_0167
# Auto-generated LookML Explore File

include: "/views/domain_02/view_00502.view.lkml"
include: "/views/domain_04/view_00504.view.lkml"
include: "/views/domain_05/view_00505.view.lkml"
include: "/views/domain_06/view_00506.view.lkml"

explore: explore_0167 {
  label: "Explore Explore 0167"
  description: "Comprehensive analytics explore joining base view_00502 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00502
  
  always_filter: {
    filters: [view_00502.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00502.created_at_date: "7 days"]
    unless: [view_00502.id, view_00502.status]
  }

  join: view_00504 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00502.user_id} = ${view_00504.id} ;;
    required_joins: []
  }

  join: view_00505 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00502.account_id} = ${view_00505.account_id} ;;
    required_joins: [view_00504]
  }

  join: view_00506 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00502.category} = ${view_00506.category} ;;
  }

  access_filter: {
    field: view_00502.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00502.is_deleted} = false ;;
}
