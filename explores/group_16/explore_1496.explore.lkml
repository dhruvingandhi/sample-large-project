# Explore: explore_1496
# Auto-generated LookML Explore File

include: "/views/domain_39/view_04489.view.lkml"
include: "/views/domain_41/view_04491.view.lkml"
include: "/views/domain_42/view_04492.view.lkml"
include: "/views/domain_43/view_04493.view.lkml"

explore: explore_1496 {
  label: "Explore Explore 1496"
  description: "Comprehensive analytics explore joining base view_04489 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04489
  
  always_filter: {
    filters: [view_04489.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04489.created_at_date: "7 days"]
    unless: [view_04489.id, view_04489.status]
  }

  join: view_04491 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04489.user_id} = ${view_04491.id} ;;
    required_joins: []
  }

  join: view_04492 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04489.account_id} = ${view_04492.account_id} ;;
    required_joins: [view_04491]
  }

  join: view_04493 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04489.category} = ${view_04493.category} ;;
  }

  access_filter: {
    field: view_04489.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04489.is_deleted} = false ;;
}
