# Explore: explore_1466
# Auto-generated LookML Explore File

include: "/views/domain_49/view_04399.view.lkml"
include: "/views/domain_01/view_04401.view.lkml"
include: "/views/domain_02/view_04402.view.lkml"
include: "/views/domain_03/view_04403.view.lkml"

explore: explore_1466 {
  label: "Explore Explore 1466"
  description: "Comprehensive analytics explore joining base view_04399 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04399
  
  always_filter: {
    filters: [view_04399.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04399.created_at_date: "7 days"]
    unless: [view_04399.id, view_04399.status]
  }

  join: view_04401 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04399.user_id} = ${view_04401.id} ;;
    required_joins: []
  }

  join: view_04402 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04399.account_id} = ${view_04402.account_id} ;;
    required_joins: [view_04401]
  }

  join: view_04403 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04399.category} = ${view_04403.category} ;;
  }

  access_filter: {
    field: view_04399.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04399.is_deleted} = false ;;
}
