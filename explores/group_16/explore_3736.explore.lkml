# Explore: explore_3736
# Auto-generated LookML Explore File

include: "/views/domain_09/view_11209.view.lkml"
include: "/views/domain_11/view_11211.view.lkml"
include: "/views/domain_12/view_11212.view.lkml"
include: "/views/domain_13/view_11213.view.lkml"

explore: explore_3736 {
  label: "Explore Explore 3736"
  description: "Comprehensive analytics explore joining base view_11209 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_11209
  
  always_filter: {
    filters: [view_11209.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11209.created_at_date: "7 days"]
    unless: [view_11209.id, view_11209.status]
  }

  join: view_11211 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11209.user_id} = ${view_11211.id} ;;
    required_joins: []
  }

  join: view_11212 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11209.account_id} = ${view_11212.account_id} ;;
    required_joins: [view_11211]
  }

  join: view_11213 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11209.category} = ${view_11213.category} ;;
  }

  access_filter: {
    field: view_11209.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11209.is_deleted} = false ;;
}
