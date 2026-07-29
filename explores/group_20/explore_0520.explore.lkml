# Explore: explore_0520
# Auto-generated LookML Explore File

include: "/views/domain_11/view_01561.view.lkml"
include: "/views/domain_13/view_01563.view.lkml"
include: "/views/domain_14/view_01564.view.lkml"
include: "/views/domain_15/view_01565.view.lkml"

explore: explore_0520 {
  label: "Explore Explore 0520"
  description: "Comprehensive analytics explore joining base view_01561 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01561
  
  always_filter: {
    filters: [view_01561.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01561.created_at_date: "7 days"]
    unless: [view_01561.id, view_01561.status]
  }

  join: view_01563 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01561.user_id} = ${view_01563.id} ;;
    required_joins: []
  }

  join: view_01564 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01561.account_id} = ${view_01564.account_id} ;;
    required_joins: [view_01563]
  }

  join: view_01565 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01561.category} = ${view_01565.category} ;;
  }

  access_filter: {
    field: view_01561.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01561.is_deleted} = false ;;
}
