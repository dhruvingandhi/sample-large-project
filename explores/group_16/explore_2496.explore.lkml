# Explore: explore_2496
# Auto-generated LookML Explore File

include: "/views/domain_39/view_07489.view.lkml"
include: "/views/domain_41/view_07491.view.lkml"
include: "/views/domain_42/view_07492.view.lkml"
include: "/views/domain_43/view_07493.view.lkml"

explore: explore_2496 {
  label: "Explore Explore 2496"
  description: "Comprehensive analytics explore joining base view_07489 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_07489
  
  always_filter: {
    filters: [view_07489.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07489.created_at_date: "7 days"]
    unless: [view_07489.id, view_07489.status]
  }

  join: view_07491 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07489.user_id} = ${view_07491.id} ;;
    required_joins: []
  }

  join: view_07492 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07489.account_id} = ${view_07492.account_id} ;;
    required_joins: [view_07491]
  }

  join: view_07493 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07489.category} = ${view_07493.category} ;;
  }

  access_filter: {
    field: view_07489.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07489.is_deleted} = false ;;
}
