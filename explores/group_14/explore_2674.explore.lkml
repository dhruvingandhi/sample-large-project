# Explore: explore_2674
# Auto-generated LookML Explore File

include: "/views/domain_23/view_08023.view.lkml"
include: "/views/domain_25/view_08025.view.lkml"
include: "/views/domain_26/view_08026.view.lkml"
include: "/views/domain_27/view_08027.view.lkml"

explore: explore_2674 {
  label: "Explore Explore 2674"
  description: "Comprehensive analytics explore joining base view_08023 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08023
  
  always_filter: {
    filters: [view_08023.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08023.created_at_date: "7 days"]
    unless: [view_08023.id, view_08023.status]
  }

  join: view_08025 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08023.user_id} = ${view_08025.id} ;;
    required_joins: []
  }

  join: view_08026 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08023.account_id} = ${view_08026.account_id} ;;
    required_joins: [view_08025]
  }

  join: view_08027 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08023.category} = ${view_08027.category} ;;
  }

  access_filter: {
    field: view_08023.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08023.is_deleted} = false ;;
}
