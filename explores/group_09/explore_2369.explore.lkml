# Explore: explore_2369
# Auto-generated LookML Explore File

include: "/views/domain_08/view_07108.view.lkml"
include: "/views/domain_10/view_07110.view.lkml"
include: "/views/domain_11/view_07111.view.lkml"
include: "/views/domain_12/view_07112.view.lkml"

explore: explore_2369 {
  label: "Explore Explore 2369"
  description: "Comprehensive analytics explore joining base view_07108 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07108
  
  always_filter: {
    filters: [view_07108.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07108.created_at_date: "7 days"]
    unless: [view_07108.id, view_07108.status]
  }

  join: view_07110 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07108.user_id} = ${view_07110.id} ;;
    required_joins: []
  }

  join: view_07111 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07108.account_id} = ${view_07111.account_id} ;;
    required_joins: [view_07110]
  }

  join: view_07112 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07108.category} = ${view_07112.category} ;;
  }

  access_filter: {
    field: view_07108.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07108.is_deleted} = false ;;
}
