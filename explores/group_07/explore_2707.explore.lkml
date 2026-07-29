# Explore: explore_2707
# Auto-generated LookML Explore File

include: "/views/domain_22/view_08122.view.lkml"
include: "/views/domain_24/view_08124.view.lkml"
include: "/views/domain_25/view_08125.view.lkml"
include: "/views/domain_26/view_08126.view.lkml"

explore: explore_2707 {
  label: "Explore Explore 2707"
  description: "Comprehensive analytics explore joining base view_08122 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_08122
  
  always_filter: {
    filters: [view_08122.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08122.created_at_date: "7 days"]
    unless: [view_08122.id, view_08122.status]
  }

  join: view_08124 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08122.user_id} = ${view_08124.id} ;;
    required_joins: []
  }

  join: view_08125 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08122.account_id} = ${view_08125.account_id} ;;
    required_joins: [view_08124]
  }

  join: view_08126 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08122.category} = ${view_08126.category} ;;
  }

  access_filter: {
    field: view_08122.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08122.is_deleted} = false ;;
}
