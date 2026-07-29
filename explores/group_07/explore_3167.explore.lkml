# Explore: explore_3167
# Auto-generated LookML Explore File

include: "/views/domain_02/view_09502.view.lkml"
include: "/views/domain_04/view_09504.view.lkml"
include: "/views/domain_05/view_09505.view.lkml"
include: "/views/domain_06/view_09506.view.lkml"

explore: explore_3167 {
  label: "Explore Explore 3167"
  description: "Comprehensive analytics explore joining base view_09502 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09502
  
  always_filter: {
    filters: [view_09502.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09502.created_at_date: "7 days"]
    unless: [view_09502.id, view_09502.status]
  }

  join: view_09504 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09502.user_id} = ${view_09504.id} ;;
    required_joins: []
  }

  join: view_09505 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09502.account_id} = ${view_09505.account_id} ;;
    required_joins: [view_09504]
  }

  join: view_09506 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09502.category} = ${view_09506.category} ;;
  }

  access_filter: {
    field: view_09502.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09502.is_deleted} = false ;;
}
