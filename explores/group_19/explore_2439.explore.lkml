# Update for 2000 file diff target
# Explore: explore_2439
# Auto-generated LookML Explore File

include: "/views/domain_18/view_07318.view.lkml"
include: "/views/domain_20/view_07320.view.lkml"
include: "/views/domain_21/view_07321.view.lkml"
include: "/views/domain_22/view_07322.view.lkml"

explore: explore_2439 {
  label: "Explore Explore 2439"
  description: "Comprehensive analytics explore joining base view_07318 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07318
  
  always_filter: {
    filters: [view_07318.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07318.created_at_date: "7 days"]
    unless: [view_07318.id, view_07318.status]
  }

  join: view_07320 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07318.user_id} = ${view_07320.id} ;;
    required_joins: []
  }

  join: view_07321 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07318.account_id} = ${view_07321.account_id} ;;
    required_joins: [view_07320]
  }

  join: view_07322 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07318.category} = ${view_07322.category} ;;
  }

  access_filter: {
    field: view_07318.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07318.is_deleted} = false ;;
}
