# Explore: explore_0508
# Auto-generated LookML Explore File

include: "/views/domain_25/view_01525.view.lkml"
include: "/views/domain_27/view_01527.view.lkml"
include: "/views/domain_28/view_01528.view.lkml"
include: "/views/domain_29/view_01529.view.lkml"

explore: explore_0508 {
  label: "Explore Explore 0508"
  description: "Comprehensive analytics explore joining base view_01525 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01525
  
  always_filter: {
    filters: [view_01525.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01525.created_at_date: "7 days"]
    unless: [view_01525.id, view_01525.status]
  }

  join: view_01527 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01525.user_id} = ${view_01527.id} ;;
    required_joins: []
  }

  join: view_01528 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01525.account_id} = ${view_01528.account_id} ;;
    required_joins: [view_01527]
  }

  join: view_01529 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01525.category} = ${view_01529.category} ;;
  }

  access_filter: {
    field: view_01525.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01525.is_deleted} = false ;;
}
