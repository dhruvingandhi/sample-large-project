# Explore: explore_3968
# Auto-generated LookML Explore File

include: "/views/domain_05/view_11905.view.lkml"
include: "/views/domain_07/view_11907.view.lkml"
include: "/views/domain_08/view_11908.view.lkml"
include: "/views/domain_09/view_11909.view.lkml"

explore: explore_3968 {
  label: "Explore Explore 3968"
  description: "Comprehensive analytics explore joining base view_11905 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11905
  
  always_filter: {
    filters: [view_11905.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11905.created_at_date: "7 days"]
    unless: [view_11905.id, view_11905.status]
  }

  join: view_11907 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11905.user_id} = ${view_11907.id} ;;
    required_joins: []
  }

  join: view_11908 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11905.account_id} = ${view_11908.account_id} ;;
    required_joins: [view_11907]
  }

  join: view_11909 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11905.category} = ${view_11909.category} ;;
  }

  access_filter: {
    field: view_11905.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11905.is_deleted} = false ;;
}
