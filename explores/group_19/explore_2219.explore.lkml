# Update for 2000 file diff target
# Explore: explore_2219
# Auto-generated LookML Explore File

include: "/views/domain_08/view_06658.view.lkml"
include: "/views/domain_10/view_06660.view.lkml"
include: "/views/domain_11/view_06661.view.lkml"
include: "/views/domain_12/view_06662.view.lkml"

explore: explore_2219 {
  label: "Explore Explore 2219"
  description: "Comprehensive analytics explore joining base view_06658 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06658
  
  always_filter: {
    filters: [view_06658.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06658.created_at_date: "7 days"]
    unless: [view_06658.id, view_06658.status]
  }

  join: view_06660 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06658.user_id} = ${view_06660.id} ;;
    required_joins: []
  }

  join: view_06661 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06658.account_id} = ${view_06661.account_id} ;;
    required_joins: [view_06660]
  }

  join: view_06662 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06658.category} = ${view_06662.category} ;;
  }

  access_filter: {
    field: view_06658.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06658.is_deleted} = false ;;
}
