# Explore: explore_2874
# Auto-generated LookML Explore File

include: "/views/domain_23/view_08623.view.lkml"
include: "/views/domain_25/view_08625.view.lkml"
include: "/views/domain_26/view_08626.view.lkml"
include: "/views/domain_27/view_08627.view.lkml"

explore: explore_2874 {
  label: "Explore Explore 2874"
  description: "Comprehensive analytics explore joining base view_08623 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08623
  
  always_filter: {
    filters: [view_08623.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08623.created_at_date: "7 days"]
    unless: [view_08623.id, view_08623.status]
  }

  join: view_08625 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08623.user_id} = ${view_08625.id} ;;
    required_joins: []
  }

  join: view_08626 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08623.account_id} = ${view_08626.account_id} ;;
    required_joins: [view_08625]
  }

  join: view_08627 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08623.category} = ${view_08627.category} ;;
  }

  access_filter: {
    field: view_08623.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08623.is_deleted} = false ;;
}
