# Explore: explore_1270
# Auto-generated LookML Explore File

include: "/views/domain_11/view_03811.view.lkml"
include: "/views/domain_13/view_03813.view.lkml"
include: "/views/domain_14/view_03814.view.lkml"
include: "/views/domain_15/view_03815.view.lkml"

explore: explore_1270 {
  label: "Explore Explore 1270"
  description: "Comprehensive analytics explore joining base view_03811 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03811
  
  always_filter: {
    filters: [view_03811.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03811.created_at_date: "7 days"]
    unless: [view_03811.id, view_03811.status]
  }

  join: view_03813 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03811.user_id} = ${view_03813.id} ;;
    required_joins: []
  }

  join: view_03814 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03811.account_id} = ${view_03814.account_id} ;;
    required_joins: [view_03813]
  }

  join: view_03815 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03811.category} = ${view_03815.category} ;;
  }

  access_filter: {
    field: view_03811.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03811.is_deleted} = false ;;
}
