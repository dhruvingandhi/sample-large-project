# Explore: explore_2449
# Auto-generated LookML Explore File

include: "/views/domain_48/view_07348.view.lkml"
include: "/views/domain_50/view_07350.view.lkml"
include: "/views/domain_01/view_07351.view.lkml"
include: "/views/domain_02/view_07352.view.lkml"

explore: explore_2449 {
  label: "Explore Explore 2449"
  description: "Comprehensive analytics explore joining base view_07348 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07348
  
  always_filter: {
    filters: [view_07348.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07348.created_at_date: "7 days"]
    unless: [view_07348.id, view_07348.status]
  }

  join: view_07350 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07348.user_id} = ${view_07350.id} ;;
    required_joins: []
  }

  join: view_07351 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07348.account_id} = ${view_07351.account_id} ;;
    required_joins: [view_07350]
  }

  join: view_07352 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07348.category} = ${view_07352.category} ;;
  }

  access_filter: {
    field: view_07348.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07348.is_deleted} = false ;;
}
