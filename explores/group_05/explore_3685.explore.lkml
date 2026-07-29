# Explore: explore_3685
# Auto-generated LookML Explore File

include: "/views/domain_06/view_11056.view.lkml"
include: "/views/domain_08/view_11058.view.lkml"
include: "/views/domain_09/view_11059.view.lkml"
include: "/views/domain_10/view_11060.view.lkml"

explore: explore_3685 {
  label: "Explore Explore 3685"
  description: "Comprehensive analytics explore joining base view_11056 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11056
  
  always_filter: {
    filters: [view_11056.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11056.created_at_date: "7 days"]
    unless: [view_11056.id, view_11056.status]
  }

  join: view_11058 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11056.user_id} = ${view_11058.id} ;;
    required_joins: []
  }

  join: view_11059 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11056.account_id} = ${view_11059.account_id} ;;
    required_joins: [view_11058]
  }

  join: view_11060 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11056.category} = ${view_11060.category} ;;
  }

  access_filter: {
    field: view_11056.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11056.is_deleted} = false ;;
}
