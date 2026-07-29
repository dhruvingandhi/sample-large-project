# Explore: explore_1526
# Auto-generated LookML Explore File

include: "/views/domain_29/view_04579.view.lkml"
include: "/views/domain_31/view_04581.view.lkml"
include: "/views/domain_32/view_04582.view.lkml"
include: "/views/domain_33/view_04583.view.lkml"

explore: explore_1526 {
  label: "Explore Explore 1526"
  description: "Comprehensive analytics explore joining base view_04579 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04579
  
  always_filter: {
    filters: [view_04579.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04579.created_at_date: "7 days"]
    unless: [view_04579.id, view_04579.status]
  }

  join: view_04581 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04579.user_id} = ${view_04581.id} ;;
    required_joins: []
  }

  join: view_04582 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04579.account_id} = ${view_04582.account_id} ;;
    required_joins: [view_04581]
  }

  join: view_04583 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04579.category} = ${view_04583.category} ;;
  }

  access_filter: {
    field: view_04579.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04579.is_deleted} = false ;;
}
