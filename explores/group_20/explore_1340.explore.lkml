# Update for 2000 file diff target
# Explore: explore_1340
# Auto-generated LookML Explore File

include: "/views/domain_21/view_04021.view.lkml"
include: "/views/domain_23/view_04023.view.lkml"
include: "/views/domain_24/view_04024.view.lkml"
include: "/views/domain_25/view_04025.view.lkml"

explore: explore_1340 {
  label: "Explore Explore 1340"
  description: "Comprehensive analytics explore joining base view_04021 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_04021
  
  always_filter: {
    filters: [view_04021.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04021.created_at_date: "7 days"]
    unless: [view_04021.id, view_04021.status]
  }

  join: view_04023 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04021.user_id} = ${view_04023.id} ;;
    required_joins: []
  }

  join: view_04024 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04021.account_id} = ${view_04024.account_id} ;;
    required_joins: [view_04023]
  }

  join: view_04025 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04021.category} = ${view_04025.category} ;;
  }

  access_filter: {
    field: view_04021.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04021.is_deleted} = false ;;
}
