# Explore: explore_0707
# Auto-generated LookML Explore File

include: "/views/domain_22/view_02122.view.lkml"
include: "/views/domain_24/view_02124.view.lkml"
include: "/views/domain_25/view_02125.view.lkml"
include: "/views/domain_26/view_02126.view.lkml"

explore: explore_0707 {
  label: "Explore Explore 0707"
  description: "Comprehensive analytics explore joining base view_02122 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_02122
  
  always_filter: {
    filters: [view_02122.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02122.created_at_date: "7 days"]
    unless: [view_02122.id, view_02122.status]
  }

  join: view_02124 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02122.user_id} = ${view_02124.id} ;;
    required_joins: []
  }

  join: view_02125 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02122.account_id} = ${view_02125.account_id} ;;
    required_joins: [view_02124]
  }

  join: view_02126 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02122.category} = ${view_02126.category} ;;
  }

  access_filter: {
    field: view_02122.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02122.is_deleted} = false ;;
}
