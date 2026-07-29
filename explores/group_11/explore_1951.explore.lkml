# Explore: explore_1951
# Auto-generated LookML Explore File

include: "/views/domain_04/view_05854.view.lkml"
include: "/views/domain_06/view_05856.view.lkml"
include: "/views/domain_07/view_05857.view.lkml"
include: "/views/domain_08/view_05858.view.lkml"

explore: explore_1951 {
  label: "Explore Explore 1951"
  description: "Comprehensive analytics explore joining base view_05854 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05854
  
  always_filter: {
    filters: [view_05854.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05854.created_at_date: "7 days"]
    unless: [view_05854.id, view_05854.status]
  }

  join: view_05856 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05854.user_id} = ${view_05856.id} ;;
    required_joins: []
  }

  join: view_05857 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05854.account_id} = ${view_05857.account_id} ;;
    required_joins: [view_05856]
  }

  join: view_05858 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05854.category} = ${view_05858.category} ;;
  }

  access_filter: {
    field: view_05854.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05854.is_deleted} = false ;;
}
