# Update for 500 file diff target
# Explore: explore_1505
# Auto-generated LookML Explore File

include: "/views/domain_16/view_04516.view.lkml"
include: "/views/domain_18/view_04518.view.lkml"
include: "/views/domain_19/view_04519.view.lkml"
include: "/views/domain_20/view_04520.view.lkml"

explore: explore_1505 {
  label: "Explore Explore 1505"
  description: "Comprehensive analytics explore joining base view_04516 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04516
  
  always_filter: {
    filters: [view_04516.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04516.created_at_date: "7 days"]
    unless: [view_04516.id, view_04516.status]
  }

  join: view_04518 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04516.user_id} = ${view_04518.id} ;;
    required_joins: []
  }

  join: view_04519 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04516.account_id} = ${view_04519.account_id} ;;
    required_joins: [view_04518]
  }

  join: view_04520 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04516.category} = ${view_04520.category} ;;
  }

  access_filter: {
    field: view_04516.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04516.is_deleted} = false ;;
}
