# Explore: explore_0523
# Auto-generated LookML Explore File

include: "/views/domain_20/view_01570.view.lkml"
include: "/views/domain_22/view_01572.view.lkml"
include: "/views/domain_23/view_01573.view.lkml"
include: "/views/domain_24/view_01574.view.lkml"

explore: explore_0523 {
  label: "Explore Explore 0523"
  description: "Comprehensive analytics explore joining base view_01570 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01570
  
  always_filter: {
    filters: [view_01570.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01570.created_at_date: "7 days"]
    unless: [view_01570.id, view_01570.status]
  }

  join: view_01572 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01570.user_id} = ${view_01572.id} ;;
    required_joins: []
  }

  join: view_01573 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01570.account_id} = ${view_01573.account_id} ;;
    required_joins: [view_01572]
  }

  join: view_01574 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01570.category} = ${view_01574.category} ;;
  }

  access_filter: {
    field: view_01570.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01570.is_deleted} = false ;;
}
