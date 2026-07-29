# Explore: explore_2007
# Auto-generated LookML Explore File

include: "/views/domain_22/view_06022.view.lkml"
include: "/views/domain_24/view_06024.view.lkml"
include: "/views/domain_25/view_06025.view.lkml"
include: "/views/domain_26/view_06026.view.lkml"

explore: explore_2007 {
  label: "Explore Explore 2007"
  description: "Comprehensive analytics explore joining base view_06022 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06022
  
  always_filter: {
    filters: [view_06022.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06022.created_at_date: "7 days"]
    unless: [view_06022.id, view_06022.status]
  }

  join: view_06024 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06022.user_id} = ${view_06024.id} ;;
    required_joins: []
  }

  join: view_06025 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06022.account_id} = ${view_06025.account_id} ;;
    required_joins: [view_06024]
  }

  join: view_06026 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06022.category} = ${view_06026.category} ;;
  }

  access_filter: {
    field: view_06022.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06022.is_deleted} = false ;;
}
