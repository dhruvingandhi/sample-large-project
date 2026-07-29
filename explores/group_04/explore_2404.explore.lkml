# Explore: explore_2404
# Auto-generated LookML Explore File

include: "/views/domain_13/view_07213.view.lkml"
include: "/views/domain_15/view_07215.view.lkml"
include: "/views/domain_16/view_07216.view.lkml"
include: "/views/domain_17/view_07217.view.lkml"

explore: explore_2404 {
  label: "Explore Explore 2404"
  description: "Comprehensive analytics explore joining base view_07213 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07213
  
  always_filter: {
    filters: [view_07213.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07213.created_at_date: "7 days"]
    unless: [view_07213.id, view_07213.status]
  }

  join: view_07215 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07213.user_id} = ${view_07215.id} ;;
    required_joins: []
  }

  join: view_07216 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07213.account_id} = ${view_07216.account_id} ;;
    required_joins: [view_07215]
  }

  join: view_07217 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07213.category} = ${view_07217.category} ;;
  }

  access_filter: {
    field: view_07213.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07213.is_deleted} = false ;;
}
