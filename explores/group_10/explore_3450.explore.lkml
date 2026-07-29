# Explore: explore_3450
# Auto-generated LookML Explore File

include: "/views/domain_01/view_10351.view.lkml"
include: "/views/domain_03/view_10353.view.lkml"
include: "/views/domain_04/view_10354.view.lkml"
include: "/views/domain_05/view_10355.view.lkml"

explore: explore_3450 {
  label: "Explore Explore 3450"
  description: "Comprehensive analytics explore joining base view_10351 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10351
  
  always_filter: {
    filters: [view_10351.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10351.created_at_date: "7 days"]
    unless: [view_10351.id, view_10351.status]
  }

  join: view_10353 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10351.user_id} = ${view_10353.id} ;;
    required_joins: []
  }

  join: view_10354 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10351.account_id} = ${view_10354.account_id} ;;
    required_joins: [view_10353]
  }

  join: view_10355 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10351.category} = ${view_10355.category} ;;
  }

  access_filter: {
    field: view_10351.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10351.is_deleted} = false ;;
}
