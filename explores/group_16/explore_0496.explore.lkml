# Explore: explore_0496
# Auto-generated LookML Explore File

include: "/views/domain_39/view_01489.view.lkml"
include: "/views/domain_41/view_01491.view.lkml"
include: "/views/domain_42/view_01492.view.lkml"
include: "/views/domain_43/view_01493.view.lkml"

explore: explore_0496 {
  label: "Explore Explore 0496"
  description: "Comprehensive analytics explore joining base view_01489 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01489
  
  always_filter: {
    filters: [view_01489.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01489.created_at_date: "7 days"]
    unless: [view_01489.id, view_01489.status]
  }

  join: view_01491 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01489.user_id} = ${view_01491.id} ;;
    required_joins: []
  }

  join: view_01492 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01489.account_id} = ${view_01492.account_id} ;;
    required_joins: [view_01491]
  }

  join: view_01493 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01489.category} = ${view_01493.category} ;;
  }

  access_filter: {
    field: view_01489.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01489.is_deleted} = false ;;
}
