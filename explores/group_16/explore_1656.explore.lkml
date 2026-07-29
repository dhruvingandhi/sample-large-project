# Explore: explore_1656
# Auto-generated LookML Explore File

include: "/views/domain_19/view_04969.view.lkml"
include: "/views/domain_21/view_04971.view.lkml"
include: "/views/domain_22/view_04972.view.lkml"
include: "/views/domain_23/view_04973.view.lkml"

explore: explore_1656 {
  label: "Explore Explore 1656"
  description: "Comprehensive analytics explore joining base view_04969 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04969
  
  always_filter: {
    filters: [view_04969.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04969.created_at_date: "7 days"]
    unless: [view_04969.id, view_04969.status]
  }

  join: view_04971 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04969.user_id} = ${view_04971.id} ;;
    required_joins: []
  }

  join: view_04972 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04969.account_id} = ${view_04972.account_id} ;;
    required_joins: [view_04971]
  }

  join: view_04973 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04969.category} = ${view_04973.category} ;;
  }

  access_filter: {
    field: view_04969.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04969.is_deleted} = false ;;
}
