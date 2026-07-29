# Explore: explore_1007
# Auto-generated LookML Explore File

include: "/views/domain_22/view_03022.view.lkml"
include: "/views/domain_24/view_03024.view.lkml"
include: "/views/domain_25/view_03025.view.lkml"
include: "/views/domain_26/view_03026.view.lkml"

explore: explore_1007 {
  label: "Explore Explore 1007"
  description: "Comprehensive analytics explore joining base view_03022 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03022
  
  always_filter: {
    filters: [view_03022.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03022.created_at_date: "7 days"]
    unless: [view_03022.id, view_03022.status]
  }

  join: view_03024 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03022.user_id} = ${view_03024.id} ;;
    required_joins: []
  }

  join: view_03025 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03022.account_id} = ${view_03025.account_id} ;;
    required_joins: [view_03024]
  }

  join: view_03026 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03022.category} = ${view_03026.category} ;;
  }

  access_filter: {
    field: view_03022.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03022.is_deleted} = false ;;
}
