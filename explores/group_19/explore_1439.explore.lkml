# Explore: explore_1439
# Auto-generated LookML Explore File

include: "/views/domain_18/view_04318.view.lkml"
include: "/views/domain_20/view_04320.view.lkml"
include: "/views/domain_21/view_04321.view.lkml"
include: "/views/domain_22/view_04322.view.lkml"

explore: explore_1439 {
  label: "Explore Explore 1439"
  description: "Comprehensive analytics explore joining base view_04318 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04318
  
  always_filter: {
    filters: [view_04318.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04318.created_at_date: "7 days"]
    unless: [view_04318.id, view_04318.status]
  }

  join: view_04320 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04318.user_id} = ${view_04320.id} ;;
    required_joins: []
  }

  join: view_04321 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04318.account_id} = ${view_04321.account_id} ;;
    required_joins: [view_04320]
  }

  join: view_04322 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04318.category} = ${view_04322.category} ;;
  }

  access_filter: {
    field: view_04318.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04318.is_deleted} = false ;;
}
