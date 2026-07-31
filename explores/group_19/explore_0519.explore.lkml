# Update for 2000 file diff target
# Explore: explore_0519
# Auto-generated LookML Explore File

include: "/views/domain_08/view_01558.view.lkml"
include: "/views/domain_10/view_01560.view.lkml"
include: "/views/domain_11/view_01561.view.lkml"
include: "/views/domain_12/view_01562.view.lkml"

explore: explore_0519 {
  label: "Explore Explore 0519"
  description: "Comprehensive analytics explore joining base view_01558 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_01558
  
  always_filter: {
    filters: [view_01558.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01558.created_at_date: "7 days"]
    unless: [view_01558.id, view_01558.status]
  }

  join: view_01560 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01558.user_id} = ${view_01560.id} ;;
    required_joins: []
  }

  join: view_01561 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01558.account_id} = ${view_01561.account_id} ;;
    required_joins: [view_01560]
  }

  join: view_01562 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01558.category} = ${view_01562.category} ;;
  }

  access_filter: {
    field: view_01558.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01558.is_deleted} = false ;;
}
