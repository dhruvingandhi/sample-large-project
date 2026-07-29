# Explore: explore_0502
# Auto-generated LookML Explore File

include: "/views/domain_07/view_01507.view.lkml"
include: "/views/domain_09/view_01509.view.lkml"
include: "/views/domain_10/view_01510.view.lkml"
include: "/views/domain_11/view_01511.view.lkml"

explore: explore_0502 {
  label: "Explore Explore 0502"
  description: "Comprehensive analytics explore joining base view_01507 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01507
  
  always_filter: {
    filters: [view_01507.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01507.created_at_date: "7 days"]
    unless: [view_01507.id, view_01507.status]
  }

  join: view_01509 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01507.user_id} = ${view_01509.id} ;;
    required_joins: []
  }

  join: view_01510 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01507.account_id} = ${view_01510.account_id} ;;
    required_joins: [view_01509]
  }

  join: view_01511 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01507.category} = ${view_01511.category} ;;
  }

  access_filter: {
    field: view_01507.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01507.is_deleted} = false ;;
}
