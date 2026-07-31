# Update for 2000 file diff target
# Explore: explore_2040
# Auto-generated LookML Explore File

include: "/views/domain_21/view_06121.view.lkml"
include: "/views/domain_23/view_06123.view.lkml"
include: "/views/domain_24/view_06124.view.lkml"
include: "/views/domain_25/view_06125.view.lkml"

explore: explore_2040 {
  label: "Explore Explore 2040"
  description: "Comprehensive analytics explore joining base view_06121 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06121
  
  always_filter: {
    filters: [view_06121.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06121.created_at_date: "7 days"]
    unless: [view_06121.id, view_06121.status]
  }

  join: view_06123 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06121.user_id} = ${view_06123.id} ;;
    required_joins: []
  }

  join: view_06124 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06121.account_id} = ${view_06124.account_id} ;;
    required_joins: [view_06123]
  }

  join: view_06125 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06121.category} = ${view_06125.category} ;;
  }

  access_filter: {
    field: view_06121.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06121.is_deleted} = false ;;
}
