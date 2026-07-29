# Explore: explore_0089
# Auto-generated LookML Explore File

include: "/views/domain_18/view_00268.view.lkml"
include: "/views/domain_20/view_00270.view.lkml"
include: "/views/domain_21/view_00271.view.lkml"
include: "/views/domain_22/view_00272.view.lkml"

explore: explore_0089 {
  label: "Explore Explore 0089"
  description: "Comprehensive analytics explore joining base view_00268 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00268
  
  always_filter: {
    filters: [view_00268.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00268.created_at_date: "7 days"]
    unless: [view_00268.id, view_00268.status]
  }

  join: view_00270 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00268.user_id} = ${view_00270.id} ;;
    required_joins: []
  }

  join: view_00271 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00268.account_id} = ${view_00271.account_id} ;;
    required_joins: [view_00270]
  }

  join: view_00272 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00268.category} = ${view_00272.category} ;;
  }

  access_filter: {
    field: view_00268.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00268.is_deleted} = false ;;
}
