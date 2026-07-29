# Explore: explore_3735
# Auto-generated LookML Explore File

include: "/views/domain_06/view_11206.view.lkml"
include: "/views/domain_08/view_11208.view.lkml"
include: "/views/domain_09/view_11209.view.lkml"
include: "/views/domain_10/view_11210.view.lkml"

explore: explore_3735 {
  label: "Explore Explore 3735"
  description: "Comprehensive analytics explore joining base view_11206 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11206
  
  always_filter: {
    filters: [view_11206.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11206.created_at_date: "7 days"]
    unless: [view_11206.id, view_11206.status]
  }

  join: view_11208 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11206.user_id} = ${view_11208.id} ;;
    required_joins: []
  }

  join: view_11209 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11206.account_id} = ${view_11209.account_id} ;;
    required_joins: [view_11208]
  }

  join: view_11210 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11206.category} = ${view_11210.category} ;;
  }

  access_filter: {
    field: view_11206.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11206.is_deleted} = false ;;
}
