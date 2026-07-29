# Explore: explore_3319
# Auto-generated LookML Explore File

include: "/views/domain_08/view_09958.view.lkml"
include: "/views/domain_10/view_09960.view.lkml"
include: "/views/domain_11/view_09961.view.lkml"
include: "/views/domain_12/view_09962.view.lkml"

explore: explore_3319 {
  label: "Explore Explore 3319"
  description: "Comprehensive analytics explore joining base view_09958 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09958
  
  always_filter: {
    filters: [view_09958.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09958.created_at_date: "7 days"]
    unless: [view_09958.id, view_09958.status]
  }

  join: view_09960 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09958.user_id} = ${view_09960.id} ;;
    required_joins: []
  }

  join: view_09961 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09958.account_id} = ${view_09961.account_id} ;;
    required_joins: [view_09960]
  }

  join: view_09962 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09958.category} = ${view_09962.category} ;;
  }

  access_filter: {
    field: view_09958.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09958.is_deleted} = false ;;
}
