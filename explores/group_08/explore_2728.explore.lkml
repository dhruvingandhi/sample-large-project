# Explore: explore_2728
# Auto-generated LookML Explore File

include: "/views/domain_35/view_08185.view.lkml"
include: "/views/domain_37/view_08187.view.lkml"
include: "/views/domain_38/view_08188.view.lkml"
include: "/views/domain_39/view_08189.view.lkml"

explore: explore_2728 {
  label: "Explore Explore 2728"
  description: "Comprehensive analytics explore joining base view_08185 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08185
  
  always_filter: {
    filters: [view_08185.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08185.created_at_date: "7 days"]
    unless: [view_08185.id, view_08185.status]
  }

  join: view_08187 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08185.user_id} = ${view_08187.id} ;;
    required_joins: []
  }

  join: view_08188 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08185.account_id} = ${view_08188.account_id} ;;
    required_joins: [view_08187]
  }

  join: view_08189 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08185.category} = ${view_08189.category} ;;
  }

  access_filter: {
    field: view_08185.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08185.is_deleted} = false ;;
}
