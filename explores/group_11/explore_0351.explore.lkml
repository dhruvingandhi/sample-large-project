# Explore: explore_0351
# Auto-generated LookML Explore File

include: "/views/domain_04/view_01054.view.lkml"
include: "/views/domain_06/view_01056.view.lkml"
include: "/views/domain_07/view_01057.view.lkml"
include: "/views/domain_08/view_01058.view.lkml"

explore: explore_0351 {
  label: "Explore Explore 0351"
  description: "Comprehensive analytics explore joining base view_01054 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01054
  
  always_filter: {
    filters: [view_01054.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01054.created_at_date: "7 days"]
    unless: [view_01054.id, view_01054.status]
  }

  join: view_01056 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01054.user_id} = ${view_01056.id} ;;
    required_joins: []
  }

  join: view_01057 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01054.account_id} = ${view_01057.account_id} ;;
    required_joins: [view_01056]
  }

  join: view_01058 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01054.category} = ${view_01058.category} ;;
  }

  access_filter: {
    field: view_01054.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01054.is_deleted} = false ;;
}
