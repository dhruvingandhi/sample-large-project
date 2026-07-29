# Explore: explore_3218
# Auto-generated LookML Explore File

include: "/views/domain_05/view_09655.view.lkml"
include: "/views/domain_07/view_09657.view.lkml"
include: "/views/domain_08/view_09658.view.lkml"
include: "/views/domain_09/view_09659.view.lkml"

explore: explore_3218 {
  label: "Explore Explore 3218"
  description: "Comprehensive analytics explore joining base view_09655 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09655
  
  always_filter: {
    filters: [view_09655.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09655.created_at_date: "7 days"]
    unless: [view_09655.id, view_09655.status]
  }

  join: view_09657 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09655.user_id} = ${view_09657.id} ;;
    required_joins: []
  }

  join: view_09658 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09655.account_id} = ${view_09658.account_id} ;;
    required_joins: [view_09657]
  }

  join: view_09659 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09655.category} = ${view_09659.category} ;;
  }

  access_filter: {
    field: view_09655.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09655.is_deleted} = false ;;
}
