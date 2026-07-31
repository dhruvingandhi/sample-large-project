# Update for 2000 file diff target
# Explore: explore_1460
# Auto-generated LookML Explore File

include: "/views/domain_31/view_04381.view.lkml"
include: "/views/domain_33/view_04383.view.lkml"
include: "/views/domain_34/view_04384.view.lkml"
include: "/views/domain_35/view_04385.view.lkml"

explore: explore_1460 {
  label: "Explore Explore 1460"
  description: "Comprehensive analytics explore joining base view_04381 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04381
  
  always_filter: {
    filters: [view_04381.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04381.created_at_date: "7 days"]
    unless: [view_04381.id, view_04381.status]
  }

  join: view_04383 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04381.user_id} = ${view_04383.id} ;;
    required_joins: []
  }

  join: view_04384 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04381.account_id} = ${view_04384.account_id} ;;
    required_joins: [view_04383]
  }

  join: view_04385 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04381.category} = ${view_04385.category} ;;
  }

  access_filter: {
    field: view_04381.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04381.is_deleted} = false ;;
}
