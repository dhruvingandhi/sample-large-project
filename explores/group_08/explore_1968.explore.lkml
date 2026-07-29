# Explore: explore_1968
# Auto-generated LookML Explore File

include: "/views/domain_05/view_05905.view.lkml"
include: "/views/domain_07/view_05907.view.lkml"
include: "/views/domain_08/view_05908.view.lkml"
include: "/views/domain_09/view_05909.view.lkml"

explore: explore_1968 {
  label: "Explore Explore 1968"
  description: "Comprehensive analytics explore joining base view_05905 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05905
  
  always_filter: {
    filters: [view_05905.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05905.created_at_date: "7 days"]
    unless: [view_05905.id, view_05905.status]
  }

  join: view_05907 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05905.user_id} = ${view_05907.id} ;;
    required_joins: []
  }

  join: view_05908 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05905.account_id} = ${view_05908.account_id} ;;
    required_joins: [view_05907]
  }

  join: view_05909 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05905.category} = ${view_05909.category} ;;
  }

  access_filter: {
    field: view_05905.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05905.is_deleted} = false ;;
}
