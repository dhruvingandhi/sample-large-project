# Explore: explore_1113
# Auto-generated LookML Explore File

include: "/views/domain_40/view_03340.view.lkml"
include: "/views/domain_42/view_03342.view.lkml"
include: "/views/domain_43/view_03343.view.lkml"
include: "/views/domain_44/view_03344.view.lkml"

explore: explore_1113 {
  label: "Explore Explore 1113"
  description: "Comprehensive analytics explore joining base view_03340 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03340
  
  always_filter: {
    filters: [view_03340.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03340.created_at_date: "7 days"]
    unless: [view_03340.id, view_03340.status]
  }

  join: view_03342 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03340.user_id} = ${view_03342.id} ;;
    required_joins: []
  }

  join: view_03343 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03340.account_id} = ${view_03343.account_id} ;;
    required_joins: [view_03342]
  }

  join: view_03344 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03340.category} = ${view_03344.category} ;;
  }

  access_filter: {
    field: view_03340.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03340.is_deleted} = false ;;
}
