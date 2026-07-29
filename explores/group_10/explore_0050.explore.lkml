# Explore: explore_0050
# Auto-generated LookML Explore File

include: "/views/domain_01/view_00151.view.lkml"
include: "/views/domain_03/view_00153.view.lkml"
include: "/views/domain_04/view_00154.view.lkml"
include: "/views/domain_05/view_00155.view.lkml"

explore: explore_0050 {
  label: "Explore Explore 0050"
  description: "Comprehensive analytics explore joining base view_00151 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00151
  
  always_filter: {
    filters: [view_00151.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00151.created_at_date: "7 days"]
    unless: [view_00151.id, view_00151.status]
  }

  join: view_00153 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00151.user_id} = ${view_00153.id} ;;
    required_joins: []
  }

  join: view_00154 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00151.account_id} = ${view_00154.account_id} ;;
    required_joins: [view_00153]
  }

  join: view_00155 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00151.category} = ${view_00155.category} ;;
  }

  access_filter: {
    field: view_00151.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00151.is_deleted} = false ;;
}
