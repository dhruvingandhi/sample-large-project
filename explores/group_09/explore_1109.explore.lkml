# Explore: explore_1109
# Auto-generated LookML Explore File

include: "/views/domain_28/view_03328.view.lkml"
include: "/views/domain_30/view_03330.view.lkml"
include: "/views/domain_31/view_03331.view.lkml"
include: "/views/domain_32/view_03332.view.lkml"

explore: explore_1109 {
  label: "Explore Explore 1109"
  description: "Comprehensive analytics explore joining base view_03328 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03328
  
  always_filter: {
    filters: [view_03328.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03328.created_at_date: "7 days"]
    unless: [view_03328.id, view_03328.status]
  }

  join: view_03330 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03328.user_id} = ${view_03330.id} ;;
    required_joins: []
  }

  join: view_03331 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03328.account_id} = ${view_03331.account_id} ;;
    required_joins: [view_03330]
  }

  join: view_03332 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03328.category} = ${view_03332.category} ;;
  }

  access_filter: {
    field: view_03328.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03328.is_deleted} = false ;;
}
