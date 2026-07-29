# Explore: explore_1253
# Auto-generated LookML Explore File

include: "/views/domain_10/view_03760.view.lkml"
include: "/views/domain_12/view_03762.view.lkml"
include: "/views/domain_13/view_03763.view.lkml"
include: "/views/domain_14/view_03764.view.lkml"

explore: explore_1253 {
  label: "Explore Explore 1253"
  description: "Comprehensive analytics explore joining base view_03760 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03760
  
  always_filter: {
    filters: [view_03760.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03760.created_at_date: "7 days"]
    unless: [view_03760.id, view_03760.status]
  }

  join: view_03762 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03760.user_id} = ${view_03762.id} ;;
    required_joins: []
  }

  join: view_03763 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03760.account_id} = ${view_03763.account_id} ;;
    required_joins: [view_03762]
  }

  join: view_03764 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03760.category} = ${view_03764.category} ;;
  }

  access_filter: {
    field: view_03760.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03760.is_deleted} = false ;;
}
