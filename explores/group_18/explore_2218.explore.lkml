# Update for 2000 file diff target
# Explore: explore_2218
# Auto-generated LookML Explore File

include: "/views/domain_05/view_06655.view.lkml"
include: "/views/domain_07/view_06657.view.lkml"
include: "/views/domain_08/view_06658.view.lkml"
include: "/views/domain_09/view_06659.view.lkml"

explore: explore_2218 {
  label: "Explore Explore 2218"
  description: "Comprehensive analytics explore joining base view_06655 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06655
  
  always_filter: {
    filters: [view_06655.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06655.created_at_date: "7 days"]
    unless: [view_06655.id, view_06655.status]
  }

  join: view_06657 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06655.user_id} = ${view_06657.id} ;;
    required_joins: []
  }

  join: view_06658 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06655.account_id} = ${view_06658.account_id} ;;
    required_joins: [view_06657]
  }

  join: view_06659 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06655.category} = ${view_06659.category} ;;
  }

  access_filter: {
    field: view_06655.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06655.is_deleted} = false ;;
}
