# Update for 2000 file diff target
# Explore: explore_2460
# Auto-generated LookML Explore File

include: "/views/domain_31/view_07381.view.lkml"
include: "/views/domain_33/view_07383.view.lkml"
include: "/views/domain_34/view_07384.view.lkml"
include: "/views/domain_35/view_07385.view.lkml"

explore: explore_2460 {
  label: "Explore Explore 2460"
  description: "Comprehensive analytics explore joining base view_07381 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07381
  
  always_filter: {
    filters: [view_07381.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07381.created_at_date: "7 days"]
    unless: [view_07381.id, view_07381.status]
  }

  join: view_07383 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07381.user_id} = ${view_07383.id} ;;
    required_joins: []
  }

  join: view_07384 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07381.account_id} = ${view_07384.account_id} ;;
    required_joins: [view_07383]
  }

  join: view_07385 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07381.category} = ${view_07385.category} ;;
  }

  access_filter: {
    field: view_07381.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07381.is_deleted} = false ;;
}
