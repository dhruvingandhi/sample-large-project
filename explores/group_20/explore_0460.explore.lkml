# Update for 2000 file diff target
# Explore: explore_0460
# Auto-generated LookML Explore File

include: "/views/domain_31/view_01381.view.lkml"
include: "/views/domain_33/view_01383.view.lkml"
include: "/views/domain_34/view_01384.view.lkml"
include: "/views/domain_35/view_01385.view.lkml"

explore: explore_0460 {
  label: "Explore Explore 0460"
  description: "Comprehensive analytics explore joining base view_01381 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01381
  
  always_filter: {
    filters: [view_01381.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01381.created_at_date: "7 days"]
    unless: [view_01381.id, view_01381.status]
  }

  join: view_01383 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01381.user_id} = ${view_01383.id} ;;
    required_joins: []
  }

  join: view_01384 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01381.account_id} = ${view_01384.account_id} ;;
    required_joins: [view_01383]
  }

  join: view_01385 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01381.category} = ${view_01385.category} ;;
  }

  access_filter: {
    field: view_01381.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01381.is_deleted} = false ;;
}
