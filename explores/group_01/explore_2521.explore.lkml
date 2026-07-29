# Explore: explore_2521
# Auto-generated LookML Explore File

include: "/views/domain_14/view_07564.view.lkml"
include: "/views/domain_16/view_07566.view.lkml"
include: "/views/domain_17/view_07567.view.lkml"
include: "/views/domain_18/view_07568.view.lkml"

explore: explore_2521 {
  label: "Explore Explore 2521"
  description: "Comprehensive analytics explore joining base view_07564 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07564
  
  always_filter: {
    filters: [view_07564.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07564.created_at_date: "7 days"]
    unless: [view_07564.id, view_07564.status]
  }

  join: view_07566 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07564.user_id} = ${view_07566.id} ;;
    required_joins: []
  }

  join: view_07567 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07564.account_id} = ${view_07567.account_id} ;;
    required_joins: [view_07566]
  }

  join: view_07568 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07564.category} = ${view_07568.category} ;;
  }

  access_filter: {
    field: view_07564.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07564.is_deleted} = false ;;
}
