# Explore: explore_0315
# Auto-generated LookML Explore File

include: "/views/domain_46/view_00946.view.lkml"
include: "/views/domain_48/view_00948.view.lkml"
include: "/views/domain_49/view_00949.view.lkml"
include: "/views/domain_50/view_00950.view.lkml"

explore: explore_0315 {
  label: "Explore Explore 0315"
  description: "Comprehensive analytics explore joining base view_00946 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00946
  
  always_filter: {
    filters: [view_00946.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00946.created_at_date: "7 days"]
    unless: [view_00946.id, view_00946.status]
  }

  join: view_00948 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00946.user_id} = ${view_00948.id} ;;
    required_joins: []
  }

  join: view_00949 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00946.account_id} = ${view_00949.account_id} ;;
    required_joins: [view_00948]
  }

  join: view_00950 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00946.category} = ${view_00950.category} ;;
  }

  access_filter: {
    field: view_00946.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00946.is_deleted} = false ;;
}
