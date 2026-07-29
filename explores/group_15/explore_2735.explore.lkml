# Explore: explore_2735
# Auto-generated LookML Explore File

include: "/views/domain_06/view_08206.view.lkml"
include: "/views/domain_08/view_08208.view.lkml"
include: "/views/domain_09/view_08209.view.lkml"
include: "/views/domain_10/view_08210.view.lkml"

explore: explore_2735 {
  label: "Explore Explore 2735"
  description: "Comprehensive analytics explore joining base view_08206 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_08206
  
  always_filter: {
    filters: [view_08206.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08206.created_at_date: "7 days"]
    unless: [view_08206.id, view_08206.status]
  }

  join: view_08208 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08206.user_id} = ${view_08208.id} ;;
    required_joins: []
  }

  join: view_08209 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08206.account_id} = ${view_08209.account_id} ;;
    required_joins: [view_08208]
  }

  join: view_08210 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08206.category} = ${view_08210.category} ;;
  }

  access_filter: {
    field: view_08206.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08206.is_deleted} = false ;;
}
