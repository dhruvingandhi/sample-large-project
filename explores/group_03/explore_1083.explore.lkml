# Explore: explore_1083
# Auto-generated LookML Explore File

include: "/views/domain_50/view_03250.view.lkml"
include: "/views/domain_02/view_03252.view.lkml"
include: "/views/domain_03/view_03253.view.lkml"
include: "/views/domain_04/view_03254.view.lkml"

explore: explore_1083 {
  label: "Explore Explore 1083"
  description: "Comprehensive analytics explore joining base view_03250 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_03250
  
  always_filter: {
    filters: [view_03250.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03250.created_at_date: "7 days"]
    unless: [view_03250.id, view_03250.status]
  }

  join: view_03252 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03250.user_id} = ${view_03252.id} ;;
    required_joins: []
  }

  join: view_03253 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03250.account_id} = ${view_03253.account_id} ;;
    required_joins: [view_03252]
  }

  join: view_03254 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03250.category} = ${view_03254.category} ;;
  }

  access_filter: {
    field: view_03250.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03250.is_deleted} = false ;;
}
