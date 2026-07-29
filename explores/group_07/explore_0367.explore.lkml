# Explore: explore_0367
# Auto-generated LookML Explore File

include: "/views/domain_02/view_01102.view.lkml"
include: "/views/domain_04/view_01104.view.lkml"
include: "/views/domain_05/view_01105.view.lkml"
include: "/views/domain_06/view_01106.view.lkml"

explore: explore_0367 {
  label: "Explore Explore 0367"
  description: "Comprehensive analytics explore joining base view_01102 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01102
  
  always_filter: {
    filters: [view_01102.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01102.created_at_date: "7 days"]
    unless: [view_01102.id, view_01102.status]
  }

  join: view_01104 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01102.user_id} = ${view_01104.id} ;;
    required_joins: []
  }

  join: view_01105 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01102.account_id} = ${view_01105.account_id} ;;
    required_joins: [view_01104]
  }

  join: view_01106 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01102.category} = ${view_01106.category} ;;
  }

  access_filter: {
    field: view_01102.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01102.is_deleted} = false ;;
}
