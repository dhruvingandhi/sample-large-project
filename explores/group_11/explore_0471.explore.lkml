# Update for 2000 file diff target
# Explore: explore_0471
# Auto-generated LookML Explore File

include: "/views/domain_14/view_01414.view.lkml"
include: "/views/domain_16/view_01416.view.lkml"
include: "/views/domain_17/view_01417.view.lkml"
include: "/views/domain_18/view_01418.view.lkml"

explore: explore_0471 {
  label: "Explore Explore 0471"
  description: "Comprehensive analytics explore joining base view_01414 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01414
  
  always_filter: {
    filters: [view_01414.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01414.created_at_date: "7 days"]
    unless: [view_01414.id, view_01414.status]
  }

  join: view_01416 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01414.user_id} = ${view_01416.id} ;;
    required_joins: []
  }

  join: view_01417 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01414.account_id} = ${view_01417.account_id} ;;
    required_joins: [view_01416]
  }

  join: view_01418 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01414.category} = ${view_01418.category} ;;
  }

  access_filter: {
    field: view_01414.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01414.is_deleted} = false ;;
}
