# Explore: explore_3113
# Auto-generated LookML Explore File

include: "/views/domain_40/view_09340.view.lkml"
include: "/views/domain_42/view_09342.view.lkml"
include: "/views/domain_43/view_09343.view.lkml"
include: "/views/domain_44/view_09344.view.lkml"

explore: explore_3113 {
  label: "Explore Explore 3113"
  description: "Comprehensive analytics explore joining base view_09340 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_09340
  
  always_filter: {
    filters: [view_09340.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09340.created_at_date: "7 days"]
    unless: [view_09340.id, view_09340.status]
  }

  join: view_09342 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09340.user_id} = ${view_09342.id} ;;
    required_joins: []
  }

  join: view_09343 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09340.account_id} = ${view_09343.account_id} ;;
    required_joins: [view_09342]
  }

  join: view_09344 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09340.category} = ${view_09344.category} ;;
  }

  access_filter: {
    field: view_09340.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09340.is_deleted} = false ;;
}
