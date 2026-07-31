# Update for 2000 file diff target
# Explore: explore_1258
# Auto-generated LookML Explore File

include: "/views/domain_25/view_03775.view.lkml"
include: "/views/domain_27/view_03777.view.lkml"
include: "/views/domain_28/view_03778.view.lkml"
include: "/views/domain_29/view_03779.view.lkml"

explore: explore_1258 {
  label: "Explore Explore 1258"
  description: "Comprehensive analytics explore joining base view_03775 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03775
  
  always_filter: {
    filters: [view_03775.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03775.created_at_date: "7 days"]
    unless: [view_03775.id, view_03775.status]
  }

  join: view_03777 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03775.user_id} = ${view_03777.id} ;;
    required_joins: []
  }

  join: view_03778 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03775.account_id} = ${view_03778.account_id} ;;
    required_joins: [view_03777]
  }

  join: view_03779 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03775.category} = ${view_03779.category} ;;
  }

  access_filter: {
    field: view_03775.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03775.is_deleted} = false ;;
}
