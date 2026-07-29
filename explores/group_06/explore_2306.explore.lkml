# Explore: explore_2306
# Auto-generated LookML Explore File

include: "/views/domain_19/view_06919.view.lkml"
include: "/views/domain_21/view_06921.view.lkml"
include: "/views/domain_22/view_06922.view.lkml"
include: "/views/domain_23/view_06923.view.lkml"

explore: explore_2306 {
  label: "Explore Explore 2306"
  description: "Comprehensive analytics explore joining base view_06919 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06919
  
  always_filter: {
    filters: [view_06919.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06919.created_at_date: "7 days"]
    unless: [view_06919.id, view_06919.status]
  }

  join: view_06921 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06919.user_id} = ${view_06921.id} ;;
    required_joins: []
  }

  join: view_06922 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06919.account_id} = ${view_06922.account_id} ;;
    required_joins: [view_06921]
  }

  join: view_06923 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06919.category} = ${view_06923.category} ;;
  }

  access_filter: {
    field: view_06919.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06919.is_deleted} = false ;;
}
