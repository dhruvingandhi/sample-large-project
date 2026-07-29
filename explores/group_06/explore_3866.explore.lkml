# Explore: explore_3866
# Auto-generated LookML Explore File

include: "/views/domain_49/view_11599.view.lkml"
include: "/views/domain_01/view_11601.view.lkml"
include: "/views/domain_02/view_11602.view.lkml"
include: "/views/domain_03/view_11603.view.lkml"

explore: explore_3866 {
  label: "Explore Explore 3866"
  description: "Comprehensive analytics explore joining base view_11599 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11599
  
  always_filter: {
    filters: [view_11599.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11599.created_at_date: "7 days"]
    unless: [view_11599.id, view_11599.status]
  }

  join: view_11601 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11599.user_id} = ${view_11601.id} ;;
    required_joins: []
  }

  join: view_11602 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11599.account_id} = ${view_11602.account_id} ;;
    required_joins: [view_11601]
  }

  join: view_11603 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11599.category} = ${view_11603.category} ;;
  }

  access_filter: {
    field: view_11599.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11599.is_deleted} = false ;;
}
