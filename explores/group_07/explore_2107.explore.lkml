# Explore: explore_2107
# Auto-generated LookML Explore File

include: "/views/domain_22/view_06322.view.lkml"
include: "/views/domain_24/view_06324.view.lkml"
include: "/views/domain_25/view_06325.view.lkml"
include: "/views/domain_26/view_06326.view.lkml"

explore: explore_2107 {
  label: "Explore Explore 2107"
  description: "Comprehensive analytics explore joining base view_06322 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06322
  
  always_filter: {
    filters: [view_06322.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06322.created_at_date: "7 days"]
    unless: [view_06322.id, view_06322.status]
  }

  join: view_06324 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06322.user_id} = ${view_06324.id} ;;
    required_joins: []
  }

  join: view_06325 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06322.account_id} = ${view_06325.account_id} ;;
    required_joins: [view_06324]
  }

  join: view_06326 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06322.category} = ${view_06326.category} ;;
  }

  access_filter: {
    field: view_06322.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06322.is_deleted} = false ;;
}
