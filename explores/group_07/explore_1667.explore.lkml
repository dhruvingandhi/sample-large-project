# Explore: explore_1667
# Auto-generated LookML Explore File

include: "/views/domain_02/view_05002.view.lkml"
include: "/views/domain_04/view_05004.view.lkml"
include: "/views/domain_05/view_05005.view.lkml"
include: "/views/domain_06/view_05006.view.lkml"

explore: explore_1667 {
  label: "Explore Explore 1667"
  description: "Comprehensive analytics explore joining base view_05002 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_05002
  
  always_filter: {
    filters: [view_05002.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05002.created_at_date: "7 days"]
    unless: [view_05002.id, view_05002.status]
  }

  join: view_05004 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05002.user_id} = ${view_05004.id} ;;
    required_joins: []
  }

  join: view_05005 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05002.account_id} = ${view_05005.account_id} ;;
    required_joins: [view_05004]
  }

  join: view_05006 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05002.category} = ${view_05006.category} ;;
  }

  access_filter: {
    field: view_05002.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05002.is_deleted} = false ;;
}
