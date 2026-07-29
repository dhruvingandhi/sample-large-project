# Explore: explore_2122
# Auto-generated LookML Explore File

include: "/views/domain_17/view_06367.view.lkml"
include: "/views/domain_19/view_06369.view.lkml"
include: "/views/domain_20/view_06370.view.lkml"
include: "/views/domain_21/view_06371.view.lkml"

explore: explore_2122 {
  label: "Explore Explore 2122"
  description: "Comprehensive analytics explore joining base view_06367 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_06367
  
  always_filter: {
    filters: [view_06367.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06367.created_at_date: "7 days"]
    unless: [view_06367.id, view_06367.status]
  }

  join: view_06369 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06367.user_id} = ${view_06369.id} ;;
    required_joins: []
  }

  join: view_06370 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06367.account_id} = ${view_06370.account_id} ;;
    required_joins: [view_06369]
  }

  join: view_06371 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06367.category} = ${view_06371.category} ;;
  }

  access_filter: {
    field: view_06367.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06367.is_deleted} = false ;;
}
