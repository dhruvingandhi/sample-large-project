# Explore: explore_3187
# Auto-generated LookML Explore File

include: "/views/domain_12/view_09562.view.lkml"
include: "/views/domain_14/view_09564.view.lkml"
include: "/views/domain_15/view_09565.view.lkml"
include: "/views/domain_16/view_09566.view.lkml"

explore: explore_3187 {
  label: "Explore Explore 3187"
  description: "Comprehensive analytics explore joining base view_09562 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09562
  
  always_filter: {
    filters: [view_09562.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09562.created_at_date: "7 days"]
    unless: [view_09562.id, view_09562.status]
  }

  join: view_09564 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09562.user_id} = ${view_09564.id} ;;
    required_joins: []
  }

  join: view_09565 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09562.account_id} = ${view_09565.account_id} ;;
    required_joins: [view_09564]
  }

  join: view_09566 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09562.category} = ${view_09566.category} ;;
  }

  access_filter: {
    field: view_09562.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09562.is_deleted} = false ;;
}
