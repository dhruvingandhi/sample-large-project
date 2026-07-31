# Update for 2000 file diff target
# Explore: explore_2800
# Auto-generated LookML Explore File

include: "/views/domain_01/view_08401.view.lkml"
include: "/views/domain_03/view_08403.view.lkml"
include: "/views/domain_04/view_08404.view.lkml"
include: "/views/domain_05/view_08405.view.lkml"

explore: explore_2800 {
  label: "Explore Explore 2800"
  description: "Comprehensive analytics explore joining base view_08401 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08401
  
  always_filter: {
    filters: [view_08401.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08401.created_at_date: "7 days"]
    unless: [view_08401.id, view_08401.status]
  }

  join: view_08403 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08401.user_id} = ${view_08403.id} ;;
    required_joins: []
  }

  join: view_08404 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08401.account_id} = ${view_08404.account_id} ;;
    required_joins: [view_08403]
  }

  join: view_08405 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08401.category} = ${view_08405.category} ;;
  }

  access_filter: {
    field: view_08401.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08401.is_deleted} = false ;;
}
