# Explore: explore_0164
# Auto-generated LookML Explore File

include: "/views/domain_43/view_00493.view.lkml"
include: "/views/domain_45/view_00495.view.lkml"
include: "/views/domain_46/view_00496.view.lkml"
include: "/views/domain_47/view_00497.view.lkml"

explore: explore_0164 {
  label: "Explore Explore 0164"
  description: "Comprehensive analytics explore joining base view_00493 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00493
  
  always_filter: {
    filters: [view_00493.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00493.created_at_date: "7 days"]
    unless: [view_00493.id, view_00493.status]
  }

  join: view_00495 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00493.user_id} = ${view_00495.id} ;;
    required_joins: []
  }

  join: view_00496 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00493.account_id} = ${view_00496.account_id} ;;
    required_joins: [view_00495]
  }

  join: view_00497 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00493.category} = ${view_00497.category} ;;
  }

  access_filter: {
    field: view_00493.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00493.is_deleted} = false ;;
}
