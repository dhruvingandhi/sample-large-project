# Explore: explore_2920
# Auto-generated LookML Explore File

include: "/views/domain_11/view_08761.view.lkml"
include: "/views/domain_13/view_08763.view.lkml"
include: "/views/domain_14/view_08764.view.lkml"
include: "/views/domain_15/view_08765.view.lkml"

explore: explore_2920 {
  label: "Explore Explore 2920"
  description: "Comprehensive analytics explore joining base view_08761 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08761
  
  always_filter: {
    filters: [view_08761.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08761.created_at_date: "7 days"]
    unless: [view_08761.id, view_08761.status]
  }

  join: view_08763 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08761.user_id} = ${view_08763.id} ;;
    required_joins: []
  }

  join: view_08764 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08761.account_id} = ${view_08764.account_id} ;;
    required_joins: [view_08763]
  }

  join: view_08765 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08761.category} = ${view_08765.category} ;;
  }

  access_filter: {
    field: view_08761.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08761.is_deleted} = false ;;
}
