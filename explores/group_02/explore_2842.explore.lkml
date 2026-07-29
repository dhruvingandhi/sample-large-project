# Explore: explore_2842
# Auto-generated LookML Explore File

include: "/views/domain_27/view_08527.view.lkml"
include: "/views/domain_29/view_08529.view.lkml"
include: "/views/domain_30/view_08530.view.lkml"
include: "/views/domain_31/view_08531.view.lkml"

explore: explore_2842 {
  label: "Explore Explore 2842"
  description: "Comprehensive analytics explore joining base view_08527 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_08527
  
  always_filter: {
    filters: [view_08527.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08527.created_at_date: "7 days"]
    unless: [view_08527.id, view_08527.status]
  }

  join: view_08529 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08527.user_id} = ${view_08529.id} ;;
    required_joins: []
  }

  join: view_08530 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08527.account_id} = ${view_08530.account_id} ;;
    required_joins: [view_08529]
  }

  join: view_08531 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08527.category} = ${view_08531.category} ;;
  }

  access_filter: {
    field: view_08527.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08527.is_deleted} = false ;;
}
