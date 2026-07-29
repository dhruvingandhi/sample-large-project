# Explore: explore_1184
# Auto-generated LookML Explore File

include: "/views/domain_03/view_03553.view.lkml"
include: "/views/domain_05/view_03555.view.lkml"
include: "/views/domain_06/view_03556.view.lkml"
include: "/views/domain_07/view_03557.view.lkml"

explore: explore_1184 {
  label: "Explore Explore 1184"
  description: "Comprehensive analytics explore joining base view_03553 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03553
  
  always_filter: {
    filters: [view_03553.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03553.created_at_date: "7 days"]
    unless: [view_03553.id, view_03553.status]
  }

  join: view_03555 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03553.user_id} = ${view_03555.id} ;;
    required_joins: []
  }

  join: view_03556 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03553.account_id} = ${view_03556.account_id} ;;
    required_joins: [view_03555]
  }

  join: view_03557 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03553.category} = ${view_03557.category} ;;
  }

  access_filter: {
    field: view_03553.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03553.is_deleted} = false ;;
}
