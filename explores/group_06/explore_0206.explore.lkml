# Explore: explore_0206
# Auto-generated LookML Explore File

include: "/views/domain_19/view_00619.view.lkml"
include: "/views/domain_21/view_00621.view.lkml"
include: "/views/domain_22/view_00622.view.lkml"
include: "/views/domain_23/view_00623.view.lkml"

explore: explore_0206 {
  label: "Explore Explore 0206"
  description: "Comprehensive analytics explore joining base view_00619 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00619
  
  always_filter: {
    filters: [view_00619.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00619.created_at_date: "7 days"]
    unless: [view_00619.id, view_00619.status]
  }

  join: view_00621 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00619.user_id} = ${view_00621.id} ;;
    required_joins: []
  }

  join: view_00622 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00619.account_id} = ${view_00622.account_id} ;;
    required_joins: [view_00621]
  }

  join: view_00623 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00619.category} = ${view_00623.category} ;;
  }

  access_filter: {
    field: view_00619.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00619.is_deleted} = false ;;
}
