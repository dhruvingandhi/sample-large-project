# Update for 2000 file diff target
# Explore: explore_0490
# Auto-generated LookML Explore File

include: "/views/domain_21/view_01471.view.lkml"
include: "/views/domain_23/view_01473.view.lkml"
include: "/views/domain_24/view_01474.view.lkml"
include: "/views/domain_25/view_01475.view.lkml"

explore: explore_0490 {
  label: "Explore Explore 0490"
  description: "Comprehensive analytics explore joining base view_01471 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_01471
  
  always_filter: {
    filters: [view_01471.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01471.created_at_date: "7 days"]
    unless: [view_01471.id, view_01471.status]
  }

  join: view_01473 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01471.user_id} = ${view_01473.id} ;;
    required_joins: []
  }

  join: view_01474 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01471.account_id} = ${view_01474.account_id} ;;
    required_joins: [view_01473]
  }

  join: view_01475 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01471.category} = ${view_01475.category} ;;
  }

  access_filter: {
    field: view_01471.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01471.is_deleted} = false ;;
}
