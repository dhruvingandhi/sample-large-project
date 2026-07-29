# Explore: explore_1600
# Auto-generated LookML Explore File

include: "/views/domain_01/view_04801.view.lkml"
include: "/views/domain_03/view_04803.view.lkml"
include: "/views/domain_04/view_04804.view.lkml"
include: "/views/domain_05/view_04805.view.lkml"

explore: explore_1600 {
  label: "Explore Explore 1600"
  description: "Comprehensive analytics explore joining base view_04801 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04801
  
  always_filter: {
    filters: [view_04801.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04801.created_at_date: "7 days"]
    unless: [view_04801.id, view_04801.status]
  }

  join: view_04803 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04801.user_id} = ${view_04803.id} ;;
    required_joins: []
  }

  join: view_04804 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04801.account_id} = ${view_04804.account_id} ;;
    required_joins: [view_04803]
  }

  join: view_04805 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04801.category} = ${view_04805.category} ;;
  }

  access_filter: {
    field: view_04801.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04801.is_deleted} = false ;;
}
