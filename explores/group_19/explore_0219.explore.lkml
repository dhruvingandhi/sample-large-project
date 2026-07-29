# Explore: explore_0219
# Auto-generated LookML Explore File

include: "/views/domain_08/view_00658.view.lkml"
include: "/views/domain_10/view_00660.view.lkml"
include: "/views/domain_11/view_00661.view.lkml"
include: "/views/domain_12/view_00662.view.lkml"

explore: explore_0219 {
  label: "Explore Explore 0219"
  description: "Comprehensive analytics explore joining base view_00658 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00658
  
  always_filter: {
    filters: [view_00658.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00658.created_at_date: "7 days"]
    unless: [view_00658.id, view_00658.status]
  }

  join: view_00660 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00658.user_id} = ${view_00660.id} ;;
    required_joins: []
  }

  join: view_00661 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00658.account_id} = ${view_00661.account_id} ;;
    required_joins: [view_00660]
  }

  join: view_00662 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00658.category} = ${view_00662.category} ;;
  }

  access_filter: {
    field: view_00658.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00658.is_deleted} = false ;;
}
