# Explore: explore_0092
# Auto-generated LookML Explore File

include: "/views/domain_27/view_00277.view.lkml"
include: "/views/domain_29/view_00279.view.lkml"
include: "/views/domain_30/view_00280.view.lkml"
include: "/views/domain_31/view_00281.view.lkml"

explore: explore_0092 {
  label: "Explore Explore 0092"
  description: "Comprehensive analytics explore joining base view_00277 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_00277
  
  always_filter: {
    filters: [view_00277.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00277.created_at_date: "7 days"]
    unless: [view_00277.id, view_00277.status]
  }

  join: view_00279 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00277.user_id} = ${view_00279.id} ;;
    required_joins: []
  }

  join: view_00280 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00277.account_id} = ${view_00280.account_id} ;;
    required_joins: [view_00279]
  }

  join: view_00281 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00277.category} = ${view_00281.category} ;;
  }

  access_filter: {
    field: view_00277.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00277.is_deleted} = false ;;
}
