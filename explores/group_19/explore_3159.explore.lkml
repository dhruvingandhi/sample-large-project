# Explore: explore_3159
# Auto-generated LookML Explore File

include: "/views/domain_28/view_09478.view.lkml"
include: "/views/domain_30/view_09480.view.lkml"
include: "/views/domain_31/view_09481.view.lkml"
include: "/views/domain_32/view_09482.view.lkml"

explore: explore_3159 {
  label: "Explore Explore 3159"
  description: "Comprehensive analytics explore joining base view_09478 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09478
  
  always_filter: {
    filters: [view_09478.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09478.created_at_date: "7 days"]
    unless: [view_09478.id, view_09478.status]
  }

  join: view_09480 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09478.user_id} = ${view_09480.id} ;;
    required_joins: []
  }

  join: view_09481 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09478.account_id} = ${view_09481.account_id} ;;
    required_joins: [view_09480]
  }

  join: view_09482 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09478.category} = ${view_09482.category} ;;
  }

  access_filter: {
    field: view_09478.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09478.is_deleted} = false ;;
}
