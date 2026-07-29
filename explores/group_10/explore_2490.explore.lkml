# Explore: explore_2490
# Auto-generated LookML Explore File

include: "/views/domain_21/view_07471.view.lkml"
include: "/views/domain_23/view_07473.view.lkml"
include: "/views/domain_24/view_07474.view.lkml"
include: "/views/domain_25/view_07475.view.lkml"

explore: explore_2490 {
  label: "Explore Explore 2490"
  description: "Comprehensive analytics explore joining base view_07471 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07471
  
  always_filter: {
    filters: [view_07471.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07471.created_at_date: "7 days"]
    unless: [view_07471.id, view_07471.status]
  }

  join: view_07473 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07471.user_id} = ${view_07473.id} ;;
    required_joins: []
  }

  join: view_07474 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07471.account_id} = ${view_07474.account_id} ;;
    required_joins: [view_07473]
  }

  join: view_07475 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07471.category} = ${view_07475.category} ;;
  }

  access_filter: {
    field: view_07471.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07471.is_deleted} = false ;;
}
