# Explore: explore_3734
# Auto-generated LookML Explore File

include: "/views/domain_03/view_11203.view.lkml"
include: "/views/domain_05/view_11205.view.lkml"
include: "/views/domain_06/view_11206.view.lkml"
include: "/views/domain_07/view_11207.view.lkml"

explore: explore_3734 {
  label: "Explore Explore 3734"
  description: "Comprehensive analytics explore joining base view_11203 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11203
  
  always_filter: {
    filters: [view_11203.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11203.created_at_date: "7 days"]
    unless: [view_11203.id, view_11203.status]
  }

  join: view_11205 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11203.user_id} = ${view_11205.id} ;;
    required_joins: []
  }

  join: view_11206 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11203.account_id} = ${view_11206.account_id} ;;
    required_joins: [view_11205]
  }

  join: view_11207 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11203.category} = ${view_11207.category} ;;
  }

  access_filter: {
    field: view_11203.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11203.is_deleted} = false ;;
}
