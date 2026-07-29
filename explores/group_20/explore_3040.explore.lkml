# Explore: explore_3040
# Auto-generated LookML Explore File

include: "/views/domain_21/view_09121.view.lkml"
include: "/views/domain_23/view_09123.view.lkml"
include: "/views/domain_24/view_09124.view.lkml"
include: "/views/domain_25/view_09125.view.lkml"

explore: explore_3040 {
  label: "Explore Explore 3040"
  description: "Comprehensive analytics explore joining base view_09121 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09121
  
  always_filter: {
    filters: [view_09121.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09121.created_at_date: "7 days"]
    unless: [view_09121.id, view_09121.status]
  }

  join: view_09123 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09121.user_id} = ${view_09123.id} ;;
    required_joins: []
  }

  join: view_09124 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09121.account_id} = ${view_09124.account_id} ;;
    required_joins: [view_09123]
  }

  join: view_09125 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09121.category} = ${view_09125.category} ;;
  }

  access_filter: {
    field: view_09121.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09121.is_deleted} = false ;;
}
