# Explore: explore_2282
# Auto-generated LookML Explore File

include: "/views/domain_47/view_06847.view.lkml"
include: "/views/domain_49/view_06849.view.lkml"
include: "/views/domain_50/view_06850.view.lkml"
include: "/views/domain_01/view_06851.view.lkml"

explore: explore_2282 {
  label: "Explore Explore 2282"
  description: "Comprehensive analytics explore joining base view_06847 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06847
  
  always_filter: {
    filters: [view_06847.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06847.created_at_date: "7 days"]
    unless: [view_06847.id, view_06847.status]
  }

  join: view_06849 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06847.user_id} = ${view_06849.id} ;;
    required_joins: []
  }

  join: view_06850 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06847.account_id} = ${view_06850.account_id} ;;
    required_joins: [view_06849]
  }

  join: view_06851 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06847.category} = ${view_06851.category} ;;
  }

  access_filter: {
    field: view_06847.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06847.is_deleted} = false ;;
}
