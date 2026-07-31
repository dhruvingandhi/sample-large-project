# Update for 2000 file diff target
# Explore: explore_1070
# Auto-generated LookML Explore File

include: "/views/domain_11/view_03211.view.lkml"
include: "/views/domain_13/view_03213.view.lkml"
include: "/views/domain_14/view_03214.view.lkml"
include: "/views/domain_15/view_03215.view.lkml"

explore: explore_1070 {
  label: "Explore Explore 1070"
  description: "Comprehensive analytics explore joining base view_03211 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03211
  
  always_filter: {
    filters: [view_03211.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03211.created_at_date: "7 days"]
    unless: [view_03211.id, view_03211.status]
  }

  join: view_03213 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03211.user_id} = ${view_03213.id} ;;
    required_joins: []
  }

  join: view_03214 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03211.account_id} = ${view_03214.account_id} ;;
    required_joins: [view_03213]
  }

  join: view_03215 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03211.category} = ${view_03215.category} ;;
  }

  access_filter: {
    field: view_03211.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03211.is_deleted} = false ;;
}
