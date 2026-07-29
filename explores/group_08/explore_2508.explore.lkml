# Explore: explore_2508
# Auto-generated LookML Explore File

include: "/views/domain_25/view_07525.view.lkml"
include: "/views/domain_27/view_07527.view.lkml"
include: "/views/domain_28/view_07528.view.lkml"
include: "/views/domain_29/view_07529.view.lkml"

explore: explore_2508 {
  label: "Explore Explore 2508"
  description: "Comprehensive analytics explore joining base view_07525 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07525
  
  always_filter: {
    filters: [view_07525.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07525.created_at_date: "7 days"]
    unless: [view_07525.id, view_07525.status]
  }

  join: view_07527 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07525.user_id} = ${view_07527.id} ;;
    required_joins: []
  }

  join: view_07528 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07525.account_id} = ${view_07528.account_id} ;;
    required_joins: [view_07527]
  }

  join: view_07529 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07525.category} = ${view_07529.category} ;;
  }

  access_filter: {
    field: view_07525.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07525.is_deleted} = false ;;
}
