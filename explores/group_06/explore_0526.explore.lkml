# Explore: explore_0526
# Auto-generated LookML Explore File

include: "/views/domain_29/view_01579.view.lkml"
include: "/views/domain_31/view_01581.view.lkml"
include: "/views/domain_32/view_01582.view.lkml"
include: "/views/domain_33/view_01583.view.lkml"

explore: explore_0526 {
  label: "Explore Explore 0526"
  description: "Comprehensive analytics explore joining base view_01579 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01579
  
  always_filter: {
    filters: [view_01579.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01579.created_at_date: "7 days"]
    unless: [view_01579.id, view_01579.status]
  }

  join: view_01581 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01579.user_id} = ${view_01581.id} ;;
    required_joins: []
  }

  join: view_01582 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01579.account_id} = ${view_01582.account_id} ;;
    required_joins: [view_01581]
  }

  join: view_01583 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01579.category} = ${view_01583.category} ;;
  }

  access_filter: {
    field: view_01579.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01579.is_deleted} = false ;;
}
