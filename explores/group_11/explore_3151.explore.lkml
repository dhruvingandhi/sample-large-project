# Explore: explore_3151
# Auto-generated LookML Explore File

include: "/views/domain_04/view_09454.view.lkml"
include: "/views/domain_06/view_09456.view.lkml"
include: "/views/domain_07/view_09457.view.lkml"
include: "/views/domain_08/view_09458.view.lkml"

explore: explore_3151 {
  label: "Explore Explore 3151"
  description: "Comprehensive analytics explore joining base view_09454 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09454
  
  always_filter: {
    filters: [view_09454.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09454.created_at_date: "7 days"]
    unless: [view_09454.id, view_09454.status]
  }

  join: view_09456 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09454.user_id} = ${view_09456.id} ;;
    required_joins: []
  }

  join: view_09457 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09454.account_id} = ${view_09457.account_id} ;;
    required_joins: [view_09456]
  }

  join: view_09458 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09454.category} = ${view_09458.category} ;;
  }

  access_filter: {
    field: view_09454.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09454.is_deleted} = false ;;
}
