# Explore: explore_0806
# Auto-generated LookML Explore File

include: "/views/domain_19/view_02419.view.lkml"
include: "/views/domain_21/view_02421.view.lkml"
include: "/views/domain_22/view_02422.view.lkml"
include: "/views/domain_23/view_02423.view.lkml"

explore: explore_0806 {
  label: "Explore Explore 0806"
  description: "Comprehensive analytics explore joining base view_02419 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_02419
  
  always_filter: {
    filters: [view_02419.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02419.created_at_date: "7 days"]
    unless: [view_02419.id, view_02419.status]
  }

  join: view_02421 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02419.user_id} = ${view_02421.id} ;;
    required_joins: []
  }

  join: view_02422 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02419.account_id} = ${view_02422.account_id} ;;
    required_joins: [view_02421]
  }

  join: view_02423 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02419.category} = ${view_02423.category} ;;
  }

  access_filter: {
    field: view_02419.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02419.is_deleted} = false ;;
}
