# Update for 2000 file diff target
# Explore: explore_2070
# Auto-generated LookML Explore File

include: "/views/domain_11/view_06211.view.lkml"
include: "/views/domain_13/view_06213.view.lkml"
include: "/views/domain_14/view_06214.view.lkml"
include: "/views/domain_15/view_06215.view.lkml"

explore: explore_2070 {
  label: "Explore Explore 2070"
  description: "Comprehensive analytics explore joining base view_06211 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06211
  
  always_filter: {
    filters: [view_06211.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06211.created_at_date: "7 days"]
    unless: [view_06211.id, view_06211.status]
  }

  join: view_06213 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06211.user_id} = ${view_06213.id} ;;
    required_joins: []
  }

  join: view_06214 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06211.account_id} = ${view_06214.account_id} ;;
    required_joins: [view_06213]
  }

  join: view_06215 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06211.category} = ${view_06215.category} ;;
  }

  access_filter: {
    field: view_06211.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06211.is_deleted} = false ;;
}
