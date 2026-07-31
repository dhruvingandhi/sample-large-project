# Update for 500 file diff target
# Explore: explore_2542
# Auto-generated LookML Explore File

include: "/views/domain_27/view_07627.view.lkml"
include: "/views/domain_29/view_07629.view.lkml"
include: "/views/domain_30/view_07630.view.lkml"
include: "/views/domain_31/view_07631.view.lkml"

explore: explore_2542 {
  label: "Explore Explore 2542"
  description: "Comprehensive analytics explore joining base view_07627 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07627
  
  always_filter: {
    filters: [view_07627.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07627.created_at_date: "7 days"]
    unless: [view_07627.id, view_07627.status]
  }

  join: view_07629 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07627.user_id} = ${view_07629.id} ;;
    required_joins: []
  }

  join: view_07630 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07627.account_id} = ${view_07630.account_id} ;;
    required_joins: [view_07629]
  }

  join: view_07631 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07627.category} = ${view_07631.category} ;;
  }

  access_filter: {
    field: view_07627.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07627.is_deleted} = false ;;
}
