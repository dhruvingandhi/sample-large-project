# Explore: explore_0552
# Auto-generated LookML Explore File

include: "/views/domain_07/view_01657.view.lkml"
include: "/views/domain_09/view_01659.view.lkml"
include: "/views/domain_10/view_01660.view.lkml"
include: "/views/domain_11/view_01661.view.lkml"

explore: explore_0552 {
  label: "Explore Explore 0552"
  description: "Comprehensive analytics explore joining base view_01657 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01657
  
  always_filter: {
    filters: [view_01657.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01657.created_at_date: "7 days"]
    unless: [view_01657.id, view_01657.status]
  }

  join: view_01659 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01657.user_id} = ${view_01659.id} ;;
    required_joins: []
  }

  join: view_01660 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01657.account_id} = ${view_01660.account_id} ;;
    required_joins: [view_01659]
  }

  join: view_01661 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01657.category} = ${view_01661.category} ;;
  }

  access_filter: {
    field: view_01657.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01657.is_deleted} = false ;;
}
