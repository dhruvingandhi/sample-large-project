# Explore: explore_0832
# Auto-generated LookML Explore File

include: "/views/domain_47/view_02497.view.lkml"
include: "/views/domain_49/view_02499.view.lkml"
include: "/views/domain_50/view_02500.view.lkml"
include: "/views/domain_01/view_02501.view.lkml"

explore: explore_0832 {
  label: "Explore Explore 0832"
  description: "Comprehensive analytics explore joining base view_02497 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02497
  
  always_filter: {
    filters: [view_02497.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02497.created_at_date: "7 days"]
    unless: [view_02497.id, view_02497.status]
  }

  join: view_02499 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02497.user_id} = ${view_02499.id} ;;
    required_joins: []
  }

  join: view_02500 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02497.account_id} = ${view_02500.account_id} ;;
    required_joins: [view_02499]
  }

  join: view_02501 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02497.category} = ${view_02501.category} ;;
  }

  access_filter: {
    field: view_02497.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02497.is_deleted} = false ;;
}
