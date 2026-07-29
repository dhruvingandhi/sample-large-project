# Explore: explore_1508
# Auto-generated LookML Explore File

include: "/views/domain_25/view_04525.view.lkml"
include: "/views/domain_27/view_04527.view.lkml"
include: "/views/domain_28/view_04528.view.lkml"
include: "/views/domain_29/view_04529.view.lkml"

explore: explore_1508 {
  label: "Explore Explore 1508"
  description: "Comprehensive analytics explore joining base view_04525 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04525
  
  always_filter: {
    filters: [view_04525.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04525.created_at_date: "7 days"]
    unless: [view_04525.id, view_04525.status]
  }

  join: view_04527 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04525.user_id} = ${view_04527.id} ;;
    required_joins: []
  }

  join: view_04528 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04525.account_id} = ${view_04528.account_id} ;;
    required_joins: [view_04527]
  }

  join: view_04529 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04525.category} = ${view_04529.category} ;;
  }

  access_filter: {
    field: view_04525.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04525.is_deleted} = false ;;
}
