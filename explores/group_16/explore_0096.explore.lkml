# Explore: explore_0096
# Auto-generated LookML Explore File

include: "/views/domain_39/view_00289.view.lkml"
include: "/views/domain_41/view_00291.view.lkml"
include: "/views/domain_42/view_00292.view.lkml"
include: "/views/domain_43/view_00293.view.lkml"

explore: explore_0096 {
  label: "Explore Explore 0096"
  description: "Comprehensive analytics explore joining base view_00289 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00289
  
  always_filter: {
    filters: [view_00289.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00289.created_at_date: "7 days"]
    unless: [view_00289.id, view_00289.status]
  }

  join: view_00291 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00289.user_id} = ${view_00291.id} ;;
    required_joins: []
  }

  join: view_00292 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00289.account_id} = ${view_00292.account_id} ;;
    required_joins: [view_00291]
  }

  join: view_00293 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00289.category} = ${view_00293.category} ;;
  }

  access_filter: {
    field: view_00289.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00289.is_deleted} = false ;;
}
