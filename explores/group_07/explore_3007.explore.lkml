# Explore: explore_3007
# Auto-generated LookML Explore File

include: "/views/domain_22/view_09022.view.lkml"
include: "/views/domain_24/view_09024.view.lkml"
include: "/views/domain_25/view_09025.view.lkml"
include: "/views/domain_26/view_09026.view.lkml"

explore: explore_3007 {
  label: "Explore Explore 3007"
  description: "Comprehensive analytics explore joining base view_09022 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09022
  
  always_filter: {
    filters: [view_09022.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09022.created_at_date: "7 days"]
    unless: [view_09022.id, view_09022.status]
  }

  join: view_09024 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09022.user_id} = ${view_09024.id} ;;
    required_joins: []
  }

  join: view_09025 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09022.account_id} = ${view_09025.account_id} ;;
    required_joins: [view_09024]
  }

  join: view_09026 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09022.category} = ${view_09026.category} ;;
  }

  access_filter: {
    field: view_09022.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09022.is_deleted} = false ;;
}
