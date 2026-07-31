# Update for 2000 file diff target
# Explore: explore_3490
# Auto-generated LookML Explore File

include: "/views/domain_21/view_10471.view.lkml"
include: "/views/domain_23/view_10473.view.lkml"
include: "/views/domain_24/view_10474.view.lkml"
include: "/views/domain_25/view_10475.view.lkml"

explore: explore_3490 {
  label: "Explore Explore 3490"
  description: "Comprehensive analytics explore joining base view_10471 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10471
  
  always_filter: {
    filters: [view_10471.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10471.created_at_date: "7 days"]
    unless: [view_10471.id, view_10471.status]
  }

  join: view_10473 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10471.user_id} = ${view_10473.id} ;;
    required_joins: []
  }

  join: view_10474 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10471.account_id} = ${view_10474.account_id} ;;
    required_joins: [view_10473]
  }

  join: view_10475 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10471.category} = ${view_10475.category} ;;
  }

  access_filter: {
    field: view_10471.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10471.is_deleted} = false ;;
}
