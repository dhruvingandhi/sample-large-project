# Explore: explore_0488
# Auto-generated LookML Explore File

include: "/views/domain_15/view_01465.view.lkml"
include: "/views/domain_17/view_01467.view.lkml"
include: "/views/domain_18/view_01468.view.lkml"
include: "/views/domain_19/view_01469.view.lkml"

explore: explore_0488 {
  label: "Explore Explore 0488"
  description: "Comprehensive analytics explore joining base view_01465 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01465
  
  always_filter: {
    filters: [view_01465.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01465.created_at_date: "7 days"]
    unless: [view_01465.id, view_01465.status]
  }

  join: view_01467 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01465.user_id} = ${view_01467.id} ;;
    required_joins: []
  }

  join: view_01468 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01465.account_id} = ${view_01468.account_id} ;;
    required_joins: [view_01467]
  }

  join: view_01469 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01465.category} = ${view_01469.category} ;;
  }

  access_filter: {
    field: view_01465.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01465.is_deleted} = false ;;
}
