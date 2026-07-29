# Explore: explore_0352
# Auto-generated LookML Explore File

include: "/views/domain_07/view_01057.view.lkml"
include: "/views/domain_09/view_01059.view.lkml"
include: "/views/domain_10/view_01060.view.lkml"
include: "/views/domain_11/view_01061.view.lkml"

explore: explore_0352 {
  label: "Explore Explore 0352"
  description: "Comprehensive analytics explore joining base view_01057 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01057
  
  always_filter: {
    filters: [view_01057.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01057.created_at_date: "7 days"]
    unless: [view_01057.id, view_01057.status]
  }

  join: view_01059 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01057.user_id} = ${view_01059.id} ;;
    required_joins: []
  }

  join: view_01060 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01057.account_id} = ${view_01060.account_id} ;;
    required_joins: [view_01059]
  }

  join: view_01061 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01057.category} = ${view_01061.category} ;;
  }

  access_filter: {
    field: view_01057.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01057.is_deleted} = false ;;
}
