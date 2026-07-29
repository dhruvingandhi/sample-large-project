# Explore: explore_2475
# Auto-generated LookML Explore File

include: "/views/domain_26/view_07426.view.lkml"
include: "/views/domain_28/view_07428.view.lkml"
include: "/views/domain_29/view_07429.view.lkml"
include: "/views/domain_30/view_07430.view.lkml"

explore: explore_2475 {
  label: "Explore Explore 2475"
  description: "Comprehensive analytics explore joining base view_07426 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07426
  
  always_filter: {
    filters: [view_07426.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07426.created_at_date: "7 days"]
    unless: [view_07426.id, view_07426.status]
  }

  join: view_07428 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07426.user_id} = ${view_07428.id} ;;
    required_joins: []
  }

  join: view_07429 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07426.account_id} = ${view_07429.account_id} ;;
    required_joins: [view_07428]
  }

  join: view_07430 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07426.category} = ${view_07430.category} ;;
  }

  access_filter: {
    field: view_07426.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07426.is_deleted} = false ;;
}
