# Explore: explore_3600
# Auto-generated LookML Explore File

include: "/views/domain_01/view_10801.view.lkml"
include: "/views/domain_03/view_10803.view.lkml"
include: "/views/domain_04/view_10804.view.lkml"
include: "/views/domain_05/view_10805.view.lkml"

explore: explore_3600 {
  label: "Explore Explore 3600"
  description: "Comprehensive analytics explore joining base view_10801 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10801
  
  always_filter: {
    filters: [view_10801.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10801.created_at_date: "7 days"]
    unless: [view_10801.id, view_10801.status]
  }

  join: view_10803 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10801.user_id} = ${view_10803.id} ;;
    required_joins: []
  }

  join: view_10804 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10801.account_id} = ${view_10804.account_id} ;;
    required_joins: [view_10803]
  }

  join: view_10805 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10801.category} = ${view_10805.category} ;;
  }

  access_filter: {
    field: view_10801.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10801.is_deleted} = false ;;
}
