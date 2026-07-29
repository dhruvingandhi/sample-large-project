# Explore: explore_0634
# Auto-generated LookML Explore File

include: "/views/domain_03/view_01903.view.lkml"
include: "/views/domain_05/view_01905.view.lkml"
include: "/views/domain_06/view_01906.view.lkml"
include: "/views/domain_07/view_01907.view.lkml"

explore: explore_0634 {
  label: "Explore Explore 0634"
  description: "Comprehensive analytics explore joining base view_01903 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01903
  
  always_filter: {
    filters: [view_01903.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01903.created_at_date: "7 days"]
    unless: [view_01903.id, view_01903.status]
  }

  join: view_01905 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01903.user_id} = ${view_01905.id} ;;
    required_joins: []
  }

  join: view_01906 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01903.account_id} = ${view_01906.account_id} ;;
    required_joins: [view_01905]
  }

  join: view_01907 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01903.category} = ${view_01907.category} ;;
  }

  access_filter: {
    field: view_01903.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01903.is_deleted} = false ;;
}
