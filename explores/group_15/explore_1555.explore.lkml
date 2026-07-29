# Explore: explore_1555
# Auto-generated LookML Explore File

include: "/views/domain_16/view_04666.view.lkml"
include: "/views/domain_18/view_04668.view.lkml"
include: "/views/domain_19/view_04669.view.lkml"
include: "/views/domain_20/view_04670.view.lkml"

explore: explore_1555 {
  label: "Explore Explore 1555"
  description: "Comprehensive analytics explore joining base view_04666 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04666
  
  always_filter: {
    filters: [view_04666.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04666.created_at_date: "7 days"]
    unless: [view_04666.id, view_04666.status]
  }

  join: view_04668 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04666.user_id} = ${view_04668.id} ;;
    required_joins: []
  }

  join: view_04669 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04666.account_id} = ${view_04669.account_id} ;;
    required_joins: [view_04668]
  }

  join: view_04670 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04666.category} = ${view_04670.category} ;;
  }

  access_filter: {
    field: view_04666.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04666.is_deleted} = false ;;
}
