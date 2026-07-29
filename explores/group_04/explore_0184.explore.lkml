# Explore: explore_0184
# Auto-generated LookML Explore File

include: "/views/domain_03/view_00553.view.lkml"
include: "/views/domain_05/view_00555.view.lkml"
include: "/views/domain_06/view_00556.view.lkml"
include: "/views/domain_07/view_00557.view.lkml"

explore: explore_0184 {
  label: "Explore Explore 0184"
  description: "Comprehensive analytics explore joining base view_00553 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00553
  
  always_filter: {
    filters: [view_00553.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00553.created_at_date: "7 days"]
    unless: [view_00553.id, view_00553.status]
  }

  join: view_00555 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00553.user_id} = ${view_00555.id} ;;
    required_joins: []
  }

  join: view_00556 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00553.account_id} = ${view_00556.account_id} ;;
    required_joins: [view_00555]
  }

  join: view_00557 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00553.category} = ${view_00557.category} ;;
  }

  access_filter: {
    field: view_00553.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00553.is_deleted} = false ;;
}
