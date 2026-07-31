# Update for 2000 file diff target
# Explore: explore_0070
# Auto-generated LookML Explore File

include: "/views/domain_11/view_00211.view.lkml"
include: "/views/domain_13/view_00213.view.lkml"
include: "/views/domain_14/view_00214.view.lkml"
include: "/views/domain_15/view_00215.view.lkml"

explore: explore_0070 {
  label: "Explore Explore 0070"
  description: "Comprehensive analytics explore joining base view_00211 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00211
  
  always_filter: {
    filters: [view_00211.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00211.created_at_date: "7 days"]
    unless: [view_00211.id, view_00211.status]
  }

  join: view_00213 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00211.user_id} = ${view_00213.id} ;;
    required_joins: []
  }

  join: view_00214 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00211.account_id} = ${view_00214.account_id} ;;
    required_joins: [view_00213]
  }

  join: view_00215 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00211.category} = ${view_00215.category} ;;
  }

  access_filter: {
    field: view_00211.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00211.is_deleted} = false ;;
}
