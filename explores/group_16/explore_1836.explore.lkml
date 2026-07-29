# Explore: explore_1836
# Auto-generated LookML Explore File

include: "/views/domain_09/view_05509.view.lkml"
include: "/views/domain_11/view_05511.view.lkml"
include: "/views/domain_12/view_05512.view.lkml"
include: "/views/domain_13/view_05513.view.lkml"

explore: explore_1836 {
  label: "Explore Explore 1836"
  description: "Comprehensive analytics explore joining base view_05509 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05509
  
  always_filter: {
    filters: [view_05509.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05509.created_at_date: "7 days"]
    unless: [view_05509.id, view_05509.status]
  }

  join: view_05511 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05509.user_id} = ${view_05511.id} ;;
    required_joins: []
  }

  join: view_05512 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05509.account_id} = ${view_05512.account_id} ;;
    required_joins: [view_05511]
  }

  join: view_05513 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05509.category} = ${view_05513.category} ;;
  }

  access_filter: {
    field: view_05509.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05509.is_deleted} = false ;;
}
