# Explore: explore_2450
# Auto-generated LookML Explore File

include: "/views/domain_01/view_07351.view.lkml"
include: "/views/domain_03/view_07353.view.lkml"
include: "/views/domain_04/view_07354.view.lkml"
include: "/views/domain_05/view_07355.view.lkml"

explore: explore_2450 {
  label: "Explore Explore 2450"
  description: "Comprehensive analytics explore joining base view_07351 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07351
  
  always_filter: {
    filters: [view_07351.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07351.created_at_date: "7 days"]
    unless: [view_07351.id, view_07351.status]
  }

  join: view_07353 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07351.user_id} = ${view_07353.id} ;;
    required_joins: []
  }

  join: view_07354 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07351.account_id} = ${view_07354.account_id} ;;
    required_joins: [view_07353]
  }

  join: view_07355 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07351.category} = ${view_07355.category} ;;
  }

  access_filter: {
    field: view_07351.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07351.is_deleted} = false ;;
}
