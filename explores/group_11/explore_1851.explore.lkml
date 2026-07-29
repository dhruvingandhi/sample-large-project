# Explore: explore_1851
# Auto-generated LookML Explore File

include: "/views/domain_04/view_05554.view.lkml"
include: "/views/domain_06/view_05556.view.lkml"
include: "/views/domain_07/view_05557.view.lkml"
include: "/views/domain_08/view_05558.view.lkml"

explore: explore_1851 {
  label: "Explore Explore 1851"
  description: "Comprehensive analytics explore joining base view_05554 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05554
  
  always_filter: {
    filters: [view_05554.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05554.created_at_date: "7 days"]
    unless: [view_05554.id, view_05554.status]
  }

  join: view_05556 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05554.user_id} = ${view_05556.id} ;;
    required_joins: []
  }

  join: view_05557 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05554.account_id} = ${view_05557.account_id} ;;
    required_joins: [view_05556]
  }

  join: view_05558 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05554.category} = ${view_05558.category} ;;
  }

  access_filter: {
    field: view_05554.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05554.is_deleted} = false ;;
}
