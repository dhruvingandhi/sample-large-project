# Update for 2000 file diff target
# Explore: explore_3460
# Auto-generated LookML Explore File

include: "/views/domain_31/view_10381.view.lkml"
include: "/views/domain_33/view_10383.view.lkml"
include: "/views/domain_34/view_10384.view.lkml"
include: "/views/domain_35/view_10385.view.lkml"

explore: explore_3460 {
  label: "Explore Explore 3460"
  description: "Comprehensive analytics explore joining base view_10381 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10381
  
  always_filter: {
    filters: [view_10381.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10381.created_at_date: "7 days"]
    unless: [view_10381.id, view_10381.status]
  }

  join: view_10383 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10381.user_id} = ${view_10383.id} ;;
    required_joins: []
  }

  join: view_10384 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10381.account_id} = ${view_10384.account_id} ;;
    required_joins: [view_10383]
  }

  join: view_10385 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10381.category} = ${view_10385.category} ;;
  }

  access_filter: {
    field: view_10381.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10381.is_deleted} = false ;;
}
