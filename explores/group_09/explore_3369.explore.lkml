# Explore: explore_3369
# Auto-generated LookML Explore File

include: "/views/domain_08/view_10108.view.lkml"
include: "/views/domain_10/view_10110.view.lkml"
include: "/views/domain_11/view_10111.view.lkml"
include: "/views/domain_12/view_10112.view.lkml"

explore: explore_3369 {
  label: "Explore Explore 3369"
  description: "Comprehensive analytics explore joining base view_10108 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10108
  
  always_filter: {
    filters: [view_10108.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10108.created_at_date: "7 days"]
    unless: [view_10108.id, view_10108.status]
  }

  join: view_10110 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10108.user_id} = ${view_10110.id} ;;
    required_joins: []
  }

  join: view_10111 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10108.account_id} = ${view_10111.account_id} ;;
    required_joins: [view_10110]
  }

  join: view_10112 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10108.category} = ${view_10112.category} ;;
  }

  access_filter: {
    field: view_10108.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10108.is_deleted} = false ;;
}
