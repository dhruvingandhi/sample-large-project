# Explore: explore_1369
# Auto-generated LookML Explore File

include: "/views/domain_08/view_04108.view.lkml"
include: "/views/domain_10/view_04110.view.lkml"
include: "/views/domain_11/view_04111.view.lkml"
include: "/views/domain_12/view_04112.view.lkml"

explore: explore_1369 {
  label: "Explore Explore 1369"
  description: "Comprehensive analytics explore joining base view_04108 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04108
  
  always_filter: {
    filters: [view_04108.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04108.created_at_date: "7 days"]
    unless: [view_04108.id, view_04108.status]
  }

  join: view_04110 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04108.user_id} = ${view_04110.id} ;;
    required_joins: []
  }

  join: view_04111 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04108.account_id} = ${view_04111.account_id} ;;
    required_joins: [view_04110]
  }

  join: view_04112 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04108.category} = ${view_04112.category} ;;
  }

  access_filter: {
    field: view_04108.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04108.is_deleted} = false ;;
}
