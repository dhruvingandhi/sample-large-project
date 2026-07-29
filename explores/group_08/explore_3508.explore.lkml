# Explore: explore_3508
# Auto-generated LookML Explore File

include: "/views/domain_25/view_10525.view.lkml"
include: "/views/domain_27/view_10527.view.lkml"
include: "/views/domain_28/view_10528.view.lkml"
include: "/views/domain_29/view_10529.view.lkml"

explore: explore_3508 {
  label: "Explore Explore 3508"
  description: "Comprehensive analytics explore joining base view_10525 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10525
  
  always_filter: {
    filters: [view_10525.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10525.created_at_date: "7 days"]
    unless: [view_10525.id, view_10525.status]
  }

  join: view_10527 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10525.user_id} = ${view_10527.id} ;;
    required_joins: []
  }

  join: view_10528 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10525.account_id} = ${view_10528.account_id} ;;
    required_joins: [view_10527]
  }

  join: view_10529 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10525.category} = ${view_10529.category} ;;
  }

  access_filter: {
    field: view_10525.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10525.is_deleted} = false ;;
}
