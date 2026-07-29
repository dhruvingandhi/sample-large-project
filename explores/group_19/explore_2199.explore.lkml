# Explore: explore_2199
# Auto-generated LookML Explore File

include: "/views/domain_48/view_06598.view.lkml"
include: "/views/domain_50/view_06600.view.lkml"
include: "/views/domain_01/view_06601.view.lkml"
include: "/views/domain_02/view_06602.view.lkml"

explore: explore_2199 {
  label: "Explore Explore 2199"
  description: "Comprehensive analytics explore joining base view_06598 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06598
  
  always_filter: {
    filters: [view_06598.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06598.created_at_date: "7 days"]
    unless: [view_06598.id, view_06598.status]
  }

  join: view_06600 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06598.user_id} = ${view_06600.id} ;;
    required_joins: []
  }

  join: view_06601 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06598.account_id} = ${view_06601.account_id} ;;
    required_joins: [view_06600]
  }

  join: view_06602 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06598.category} = ${view_06602.category} ;;
  }

  access_filter: {
    field: view_06598.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06598.is_deleted} = false ;;
}
