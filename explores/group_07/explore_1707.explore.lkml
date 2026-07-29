# Explore: explore_1707
# Auto-generated LookML Explore File

include: "/views/domain_22/view_05122.view.lkml"
include: "/views/domain_24/view_05124.view.lkml"
include: "/views/domain_25/view_05125.view.lkml"
include: "/views/domain_26/view_05126.view.lkml"

explore: explore_1707 {
  label: "Explore Explore 1707"
  description: "Comprehensive analytics explore joining base view_05122 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05122
  
  always_filter: {
    filters: [view_05122.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05122.created_at_date: "7 days"]
    unless: [view_05122.id, view_05122.status]
  }

  join: view_05124 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05122.user_id} = ${view_05124.id} ;;
    required_joins: []
  }

  join: view_05125 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05122.account_id} = ${view_05125.account_id} ;;
    required_joins: [view_05124]
  }

  join: view_05126 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05122.category} = ${view_05126.category} ;;
  }

  access_filter: {
    field: view_05122.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05122.is_deleted} = false ;;
}
