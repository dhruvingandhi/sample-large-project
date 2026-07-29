# Explore: explore_2039
# Auto-generated LookML Explore File

include: "/views/domain_18/view_06118.view.lkml"
include: "/views/domain_20/view_06120.view.lkml"
include: "/views/domain_21/view_06121.view.lkml"
include: "/views/domain_22/view_06122.view.lkml"

explore: explore_2039 {
  label: "Explore Explore 2039"
  description: "Comprehensive analytics explore joining base view_06118 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06118
  
  always_filter: {
    filters: [view_06118.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06118.created_at_date: "7 days"]
    unless: [view_06118.id, view_06118.status]
  }

  join: view_06120 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06118.user_id} = ${view_06120.id} ;;
    required_joins: []
  }

  join: view_06121 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06118.account_id} = ${view_06121.account_id} ;;
    required_joins: [view_06120]
  }

  join: view_06122 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06118.category} = ${view_06122.category} ;;
  }

  access_filter: {
    field: view_06118.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06118.is_deleted} = false ;;
}
