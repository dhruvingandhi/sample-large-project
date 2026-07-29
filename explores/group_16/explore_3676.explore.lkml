# Explore: explore_3676
# Auto-generated LookML Explore File

include: "/views/domain_29/view_11029.view.lkml"
include: "/views/domain_31/view_11031.view.lkml"
include: "/views/domain_32/view_11032.view.lkml"
include: "/views/domain_33/view_11033.view.lkml"

explore: explore_3676 {
  label: "Explore Explore 3676"
  description: "Comprehensive analytics explore joining base view_11029 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11029
  
  always_filter: {
    filters: [view_11029.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11029.created_at_date: "7 days"]
    unless: [view_11029.id, view_11029.status]
  }

  join: view_11031 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11029.user_id} = ${view_11031.id} ;;
    required_joins: []
  }

  join: view_11032 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11029.account_id} = ${view_11032.account_id} ;;
    required_joins: [view_11031]
  }

  join: view_11033 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11029.category} = ${view_11033.category} ;;
  }

  access_filter: {
    field: view_11029.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11029.is_deleted} = false ;;
}
