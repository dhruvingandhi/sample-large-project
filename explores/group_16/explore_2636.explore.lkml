# Explore: explore_2636
# Auto-generated LookML Explore File

include: "/views/domain_09/view_07909.view.lkml"
include: "/views/domain_11/view_07911.view.lkml"
include: "/views/domain_12/view_07912.view.lkml"
include: "/views/domain_13/view_07913.view.lkml"

explore: explore_2636 {
  label: "Explore Explore 2636"
  description: "Comprehensive analytics explore joining base view_07909 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07909
  
  always_filter: {
    filters: [view_07909.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07909.created_at_date: "7 days"]
    unless: [view_07909.id, view_07909.status]
  }

  join: view_07911 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07909.user_id} = ${view_07911.id} ;;
    required_joins: []
  }

  join: view_07912 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07909.account_id} = ${view_07912.account_id} ;;
    required_joins: [view_07911]
  }

  join: view_07913 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07909.category} = ${view_07913.category} ;;
  }

  access_filter: {
    field: view_07909.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07909.is_deleted} = false ;;
}
