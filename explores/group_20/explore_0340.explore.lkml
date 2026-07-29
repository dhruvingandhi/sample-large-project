# Explore: explore_0340
# Auto-generated LookML Explore File

include: "/views/domain_21/view_01021.view.lkml"
include: "/views/domain_23/view_01023.view.lkml"
include: "/views/domain_24/view_01024.view.lkml"
include: "/views/domain_25/view_01025.view.lkml"

explore: explore_0340 {
  label: "Explore Explore 0340"
  description: "Comprehensive analytics explore joining base view_01021 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01021
  
  always_filter: {
    filters: [view_01021.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01021.created_at_date: "7 days"]
    unless: [view_01021.id, view_01021.status]
  }

  join: view_01023 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01021.user_id} = ${view_01023.id} ;;
    required_joins: []
  }

  join: view_01024 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01021.account_id} = ${view_01024.account_id} ;;
    required_joins: [view_01023]
  }

  join: view_01025 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01021.category} = ${view_01025.category} ;;
  }

  access_filter: {
    field: view_01021.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01021.is_deleted} = false ;;
}
