# Explore: explore_2271
# Auto-generated LookML Explore File

include: "/views/domain_14/view_06814.view.lkml"
include: "/views/domain_16/view_06816.view.lkml"
include: "/views/domain_17/view_06817.view.lkml"
include: "/views/domain_18/view_06818.view.lkml"

explore: explore_2271 {
  label: "Explore Explore 2271"
  description: "Comprehensive analytics explore joining base view_06814 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_06814
  
  always_filter: {
    filters: [view_06814.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06814.created_at_date: "7 days"]
    unless: [view_06814.id, view_06814.status]
  }

  join: view_06816 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06814.user_id} = ${view_06816.id} ;;
    required_joins: []
  }

  join: view_06817 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06814.account_id} = ${view_06817.account_id} ;;
    required_joins: [view_06816]
  }

  join: view_06818 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06814.category} = ${view_06818.category} ;;
  }

  access_filter: {
    field: view_06814.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06814.is_deleted} = false ;;
}
