# Explore: explore_3707
# Auto-generated LookML Explore File

include: "/views/domain_22/view_11122.view.lkml"
include: "/views/domain_24/view_11124.view.lkml"
include: "/views/domain_25/view_11125.view.lkml"
include: "/views/domain_26/view_11126.view.lkml"

explore: explore_3707 {
  label: "Explore Explore 3707"
  description: "Comprehensive analytics explore joining base view_11122 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_11122
  
  always_filter: {
    filters: [view_11122.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11122.created_at_date: "7 days"]
    unless: [view_11122.id, view_11122.status]
  }

  join: view_11124 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11122.user_id} = ${view_11124.id} ;;
    required_joins: []
  }

  join: view_11125 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11122.account_id} = ${view_11125.account_id} ;;
    required_joins: [view_11124]
  }

  join: view_11126 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11122.category} = ${view_11126.category} ;;
  }

  access_filter: {
    field: view_11122.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11122.is_deleted} = false ;;
}
