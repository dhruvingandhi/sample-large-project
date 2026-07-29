# Explore: explore_0652
# Auto-generated LookML Explore File

include: "/views/domain_07/view_01957.view.lkml"
include: "/views/domain_09/view_01959.view.lkml"
include: "/views/domain_10/view_01960.view.lkml"
include: "/views/domain_11/view_01961.view.lkml"

explore: explore_0652 {
  label: "Explore Explore 0652"
  description: "Comprehensive analytics explore joining base view_01957 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01957
  
  always_filter: {
    filters: [view_01957.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01957.created_at_date: "7 days"]
    unless: [view_01957.id, view_01957.status]
  }

  join: view_01959 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01957.user_id} = ${view_01959.id} ;;
    required_joins: []
  }

  join: view_01960 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01957.account_id} = ${view_01960.account_id} ;;
    required_joins: [view_01959]
  }

  join: view_01961 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01957.category} = ${view_01961.category} ;;
  }

  access_filter: {
    field: view_01957.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01957.is_deleted} = false ;;
}
