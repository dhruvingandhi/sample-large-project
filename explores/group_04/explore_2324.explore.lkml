# Explore: explore_2324
# Auto-generated LookML Explore File

include: "/views/domain_23/view_06973.view.lkml"
include: "/views/domain_25/view_06975.view.lkml"
include: "/views/domain_26/view_06976.view.lkml"
include: "/views/domain_27/view_06977.view.lkml"

explore: explore_2324 {
  label: "Explore Explore 2324"
  description: "Comprehensive analytics explore joining base view_06973 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06973
  
  always_filter: {
    filters: [view_06973.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06973.created_at_date: "7 days"]
    unless: [view_06973.id, view_06973.status]
  }

  join: view_06975 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06973.user_id} = ${view_06975.id} ;;
    required_joins: []
  }

  join: view_06976 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06973.account_id} = ${view_06976.account_id} ;;
    required_joins: [view_06975]
  }

  join: view_06977 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06973.category} = ${view_06977.category} ;;
  }

  access_filter: {
    field: view_06973.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06973.is_deleted} = false ;;
}
