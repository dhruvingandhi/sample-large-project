# Explore: explore_0074
# Auto-generated LookML Explore File

include: "/views/domain_23/view_00223.view.lkml"
include: "/views/domain_25/view_00225.view.lkml"
include: "/views/domain_26/view_00226.view.lkml"
include: "/views/domain_27/view_00227.view.lkml"

explore: explore_0074 {
  label: "Explore Explore 0074"
  description: "Comprehensive analytics explore joining base view_00223 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00223
  
  always_filter: {
    filters: [view_00223.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00223.created_at_date: "7 days"]
    unless: [view_00223.id, view_00223.status]
  }

  join: view_00225 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00223.user_id} = ${view_00225.id} ;;
    required_joins: []
  }

  join: view_00226 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00223.account_id} = ${view_00226.account_id} ;;
    required_joins: [view_00225]
  }

  join: view_00227 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00223.category} = ${view_00227.category} ;;
  }

  access_filter: {
    field: view_00223.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00223.is_deleted} = false ;;
}
