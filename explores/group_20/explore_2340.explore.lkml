# Update for 2000 file diff target
# Explore: explore_2340
# Auto-generated LookML Explore File

include: "/views/domain_21/view_07021.view.lkml"
include: "/views/domain_23/view_07023.view.lkml"
include: "/views/domain_24/view_07024.view.lkml"
include: "/views/domain_25/view_07025.view.lkml"

explore: explore_2340 {
  label: "Explore Explore 2340"
  description: "Comprehensive analytics explore joining base view_07021 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07021
  
  always_filter: {
    filters: [view_07021.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07021.created_at_date: "7 days"]
    unless: [view_07021.id, view_07021.status]
  }

  join: view_07023 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07021.user_id} = ${view_07023.id} ;;
    required_joins: []
  }

  join: view_07024 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07021.account_id} = ${view_07024.account_id} ;;
    required_joins: [view_07023]
  }

  join: view_07025 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07021.category} = ${view_07025.category} ;;
  }

  access_filter: {
    field: view_07021.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07021.is_deleted} = false ;;
}
