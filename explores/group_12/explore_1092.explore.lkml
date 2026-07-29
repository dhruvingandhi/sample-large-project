# Explore: explore_1092
# Auto-generated LookML Explore File

include: "/views/domain_27/view_03277.view.lkml"
include: "/views/domain_29/view_03279.view.lkml"
include: "/views/domain_30/view_03280.view.lkml"
include: "/views/domain_31/view_03281.view.lkml"

explore: explore_1092 {
  label: "Explore Explore 1092"
  description: "Comprehensive analytics explore joining base view_03277 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03277
  
  always_filter: {
    filters: [view_03277.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03277.created_at_date: "7 days"]
    unless: [view_03277.id, view_03277.status]
  }

  join: view_03279 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03277.user_id} = ${view_03279.id} ;;
    required_joins: []
  }

  join: view_03280 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03277.account_id} = ${view_03280.account_id} ;;
    required_joins: [view_03279]
  }

  join: view_03281 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03277.category} = ${view_03281.category} ;;
  }

  access_filter: {
    field: view_03277.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03277.is_deleted} = false ;;
}
