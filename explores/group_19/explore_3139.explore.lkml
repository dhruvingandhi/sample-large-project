# Explore: explore_3139
# Auto-generated LookML Explore File

include: "/views/domain_18/view_09418.view.lkml"
include: "/views/domain_20/view_09420.view.lkml"
include: "/views/domain_21/view_09421.view.lkml"
include: "/views/domain_22/view_09422.view.lkml"

explore: explore_3139 {
  label: "Explore Explore 3139"
  description: "Comprehensive analytics explore joining base view_09418 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09418
  
  always_filter: {
    filters: [view_09418.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09418.created_at_date: "7 days"]
    unless: [view_09418.id, view_09418.status]
  }

  join: view_09420 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09418.user_id} = ${view_09420.id} ;;
    required_joins: []
  }

  join: view_09421 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09418.account_id} = ${view_09421.account_id} ;;
    required_joins: [view_09420]
  }

  join: view_09422 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09418.category} = ${view_09422.category} ;;
  }

  access_filter: {
    field: view_09418.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09418.is_deleted} = false ;;
}
