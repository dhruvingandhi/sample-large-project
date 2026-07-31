# Update for 2000 file diff target
# Explore: explore_1350
# Auto-generated LookML Explore File

include: "/views/domain_01/view_04051.view.lkml"
include: "/views/domain_03/view_04053.view.lkml"
include: "/views/domain_04/view_04054.view.lkml"
include: "/views/domain_05/view_04055.view.lkml"

explore: explore_1350 {
  label: "Explore Explore 1350"
  description: "Comprehensive analytics explore joining base view_04051 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04051
  
  always_filter: {
    filters: [view_04051.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04051.created_at_date: "7 days"]
    unless: [view_04051.id, view_04051.status]
  }

  join: view_04053 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04051.user_id} = ${view_04053.id} ;;
    required_joins: []
  }

  join: view_04054 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04051.account_id} = ${view_04054.account_id} ;;
    required_joins: [view_04053]
  }

  join: view_04055 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04051.category} = ${view_04055.category} ;;
  }

  access_filter: {
    field: view_04051.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04051.is_deleted} = false ;;
}
