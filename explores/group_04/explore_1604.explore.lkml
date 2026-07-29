# Explore: explore_1604
# Auto-generated LookML Explore File

include: "/views/domain_13/view_04813.view.lkml"
include: "/views/domain_15/view_04815.view.lkml"
include: "/views/domain_16/view_04816.view.lkml"
include: "/views/domain_17/view_04817.view.lkml"

explore: explore_1604 {
  label: "Explore Explore 1604"
  description: "Comprehensive analytics explore joining base view_04813 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04813
  
  always_filter: {
    filters: [view_04813.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04813.created_at_date: "7 days"]
    unless: [view_04813.id, view_04813.status]
  }

  join: view_04815 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04813.user_id} = ${view_04815.id} ;;
    required_joins: []
  }

  join: view_04816 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04813.account_id} = ${view_04816.account_id} ;;
    required_joins: [view_04815]
  }

  join: view_04817 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04813.category} = ${view_04817.category} ;;
  }

  access_filter: {
    field: view_04813.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04813.is_deleted} = false ;;
}
