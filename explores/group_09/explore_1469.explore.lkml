# Explore: explore_1469
# Auto-generated LookML Explore File

include: "/views/domain_08/view_04408.view.lkml"
include: "/views/domain_10/view_04410.view.lkml"
include: "/views/domain_11/view_04411.view.lkml"
include: "/views/domain_12/view_04412.view.lkml"

explore: explore_1469 {
  label: "Explore Explore 1469"
  description: "Comprehensive analytics explore joining base view_04408 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04408
  
  always_filter: {
    filters: [view_04408.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04408.created_at_date: "7 days"]
    unless: [view_04408.id, view_04408.status]
  }

  join: view_04410 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04408.user_id} = ${view_04410.id} ;;
    required_joins: []
  }

  join: view_04411 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04408.account_id} = ${view_04411.account_id} ;;
    required_joins: [view_04410]
  }

  join: view_04412 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04408.category} = ${view_04412.category} ;;
  }

  access_filter: {
    field: view_04408.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04408.is_deleted} = false ;;
}
