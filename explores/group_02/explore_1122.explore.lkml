# Explore: explore_1122
# Auto-generated LookML Explore File

include: "/views/domain_17/view_03367.view.lkml"
include: "/views/domain_19/view_03369.view.lkml"
include: "/views/domain_20/view_03370.view.lkml"
include: "/views/domain_21/view_03371.view.lkml"

explore: explore_1122 {
  label: "Explore Explore 1122"
  description: "Comprehensive analytics explore joining base view_03367 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03367
  
  always_filter: {
    filters: [view_03367.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03367.created_at_date: "7 days"]
    unless: [view_03367.id, view_03367.status]
  }

  join: view_03369 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03367.user_id} = ${view_03369.id} ;;
    required_joins: []
  }

  join: view_03370 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03367.account_id} = ${view_03370.account_id} ;;
    required_joins: [view_03369]
  }

  join: view_03371 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03367.category} = ${view_03371.category} ;;
  }

  access_filter: {
    field: view_03367.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03367.is_deleted} = false ;;
}
