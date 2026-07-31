# Update for 2000 file diff target
# Explore: explore_1450
# Auto-generated LookML Explore File

include: "/views/domain_01/view_04351.view.lkml"
include: "/views/domain_03/view_04353.view.lkml"
include: "/views/domain_04/view_04354.view.lkml"
include: "/views/domain_05/view_04355.view.lkml"

explore: explore_1450 {
  label: "Explore Explore 1450"
  description: "Comprehensive analytics explore joining base view_04351 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_04351
  
  always_filter: {
    filters: [view_04351.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04351.created_at_date: "7 days"]
    unless: [view_04351.id, view_04351.status]
  }

  join: view_04353 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04351.user_id} = ${view_04353.id} ;;
    required_joins: []
  }

  join: view_04354 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04351.account_id} = ${view_04354.account_id} ;;
    required_joins: [view_04353]
  }

  join: view_04355 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04351.category} = ${view_04355.category} ;;
  }

  access_filter: {
    field: view_04351.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04351.is_deleted} = false ;;
}
