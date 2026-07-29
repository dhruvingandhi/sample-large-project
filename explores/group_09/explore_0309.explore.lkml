# Explore: explore_0309
# Auto-generated LookML Explore File

include: "/views/domain_28/view_00928.view.lkml"
include: "/views/domain_30/view_00930.view.lkml"
include: "/views/domain_31/view_00931.view.lkml"
include: "/views/domain_32/view_00932.view.lkml"

explore: explore_0309 {
  label: "Explore Explore 0309"
  description: "Comprehensive analytics explore joining base view_00928 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00928
  
  always_filter: {
    filters: [view_00928.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00928.created_at_date: "7 days"]
    unless: [view_00928.id, view_00928.status]
  }

  join: view_00930 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00928.user_id} = ${view_00930.id} ;;
    required_joins: []
  }

  join: view_00931 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00928.account_id} = ${view_00931.account_id} ;;
    required_joins: [view_00930]
  }

  join: view_00932 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00928.category} = ${view_00932.category} ;;
  }

  access_filter: {
    field: view_00928.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00928.is_deleted} = false ;;
}
