# Explore: explore_0534
# Auto-generated LookML Explore File

include: "/views/domain_03/view_01603.view.lkml"
include: "/views/domain_05/view_01605.view.lkml"
include: "/views/domain_06/view_01606.view.lkml"
include: "/views/domain_07/view_01607.view.lkml"

explore: explore_0534 {
  label: "Explore Explore 0534"
  description: "Comprehensive analytics explore joining base view_01603 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01603
  
  always_filter: {
    filters: [view_01603.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01603.created_at_date: "7 days"]
    unless: [view_01603.id, view_01603.status]
  }

  join: view_01605 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01603.user_id} = ${view_01605.id} ;;
    required_joins: []
  }

  join: view_01606 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01603.account_id} = ${view_01606.account_id} ;;
    required_joins: [view_01605]
  }

  join: view_01607 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01603.category} = ${view_01607.category} ;;
  }

  access_filter: {
    field: view_01603.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01603.is_deleted} = false ;;
}
