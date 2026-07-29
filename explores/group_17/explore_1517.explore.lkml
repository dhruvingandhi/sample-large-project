# Explore: explore_1517
# Auto-generated LookML Explore File

include: "/views/domain_02/view_04552.view.lkml"
include: "/views/domain_04/view_04554.view.lkml"
include: "/views/domain_05/view_04555.view.lkml"
include: "/views/domain_06/view_04556.view.lkml"

explore: explore_1517 {
  label: "Explore Explore 1517"
  description: "Comprehensive analytics explore joining base view_04552 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_04552
  
  always_filter: {
    filters: [view_04552.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04552.created_at_date: "7 days"]
    unless: [view_04552.id, view_04552.status]
  }

  join: view_04554 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04552.user_id} = ${view_04554.id} ;;
    required_joins: []
  }

  join: view_04555 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04552.account_id} = ${view_04555.account_id} ;;
    required_joins: [view_04554]
  }

  join: view_04556 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04552.category} = ${view_04556.category} ;;
  }

  access_filter: {
    field: view_04552.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04552.is_deleted} = false ;;
}
