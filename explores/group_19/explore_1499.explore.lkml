# Update for 2000 file diff target
# Explore: explore_1499
# Auto-generated LookML Explore File

include: "/views/domain_48/view_04498.view.lkml"
include: "/views/domain_50/view_04500.view.lkml"
include: "/views/domain_01/view_04501.view.lkml"
include: "/views/domain_02/view_04502.view.lkml"

explore: explore_1499 {
  label: "Explore Explore 1499"
  description: "Comprehensive analytics explore joining base view_04498 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_04498
  
  always_filter: {
    filters: [view_04498.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04498.created_at_date: "7 days"]
    unless: [view_04498.id, view_04498.status]
  }

  join: view_04500 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04498.user_id} = ${view_04500.id} ;;
    required_joins: []
  }

  join: view_04501 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04498.account_id} = ${view_04501.account_id} ;;
    required_joins: [view_04500]
  }

  join: view_04502 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04498.category} = ${view_04502.category} ;;
  }

  access_filter: {
    field: view_04498.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04498.is_deleted} = false ;;
}
