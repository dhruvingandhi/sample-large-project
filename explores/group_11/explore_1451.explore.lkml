# Explore: explore_1451
# Auto-generated LookML Explore File

include: "/views/domain_04/view_04354.view.lkml"
include: "/views/domain_06/view_04356.view.lkml"
include: "/views/domain_07/view_04357.view.lkml"
include: "/views/domain_08/view_04358.view.lkml"

explore: explore_1451 {
  label: "Explore Explore 1451"
  description: "Comprehensive analytics explore joining base view_04354 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04354
  
  always_filter: {
    filters: [view_04354.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04354.created_at_date: "7 days"]
    unless: [view_04354.id, view_04354.status]
  }

  join: view_04356 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04354.user_id} = ${view_04356.id} ;;
    required_joins: []
  }

  join: view_04357 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04354.account_id} = ${view_04357.account_id} ;;
    required_joins: [view_04356]
  }

  join: view_04358 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04354.category} = ${view_04358.category} ;;
  }

  access_filter: {
    field: view_04354.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04354.is_deleted} = false ;;
}
