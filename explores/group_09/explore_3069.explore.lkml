# Explore: explore_3069
# Auto-generated LookML Explore File

include: "/views/domain_08/view_09208.view.lkml"
include: "/views/domain_10/view_09210.view.lkml"
include: "/views/domain_11/view_09211.view.lkml"
include: "/views/domain_12/view_09212.view.lkml"

explore: explore_3069 {
  label: "Explore Explore 3069"
  description: "Comprehensive analytics explore joining base view_09208 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09208
  
  always_filter: {
    filters: [view_09208.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09208.created_at_date: "7 days"]
    unless: [view_09208.id, view_09208.status]
  }

  join: view_09210 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09208.user_id} = ${view_09210.id} ;;
    required_joins: []
  }

  join: view_09211 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09208.account_id} = ${view_09211.account_id} ;;
    required_joins: [view_09210]
  }

  join: view_09212 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09208.category} = ${view_09212.category} ;;
  }

  access_filter: {
    field: view_09208.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09208.is_deleted} = false ;;
}
