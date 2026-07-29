# Explore: explore_0600
# Auto-generated LookML Explore File

include: "/views/domain_01/view_01801.view.lkml"
include: "/views/domain_03/view_01803.view.lkml"
include: "/views/domain_04/view_01804.view.lkml"
include: "/views/domain_05/view_01805.view.lkml"

explore: explore_0600 {
  label: "Explore Explore 0600"
  description: "Comprehensive analytics explore joining base view_01801 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01801
  
  always_filter: {
    filters: [view_01801.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01801.created_at_date: "7 days"]
    unless: [view_01801.id, view_01801.status]
  }

  join: view_01803 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01801.user_id} = ${view_01803.id} ;;
    required_joins: []
  }

  join: view_01804 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01801.account_id} = ${view_01804.account_id} ;;
    required_joins: [view_01803]
  }

  join: view_01805 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01801.category} = ${view_01805.category} ;;
  }

  access_filter: {
    field: view_01801.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01801.is_deleted} = false ;;
}
