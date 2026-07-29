# Explore: explore_0757
# Auto-generated LookML Explore File

include: "/views/domain_22/view_02272.view.lkml"
include: "/views/domain_24/view_02274.view.lkml"
include: "/views/domain_25/view_02275.view.lkml"
include: "/views/domain_26/view_02276.view.lkml"

explore: explore_0757 {
  label: "Explore Explore 0757"
  description: "Comprehensive analytics explore joining base view_02272 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02272
  
  always_filter: {
    filters: [view_02272.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02272.created_at_date: "7 days"]
    unless: [view_02272.id, view_02272.status]
  }

  join: view_02274 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02272.user_id} = ${view_02274.id} ;;
    required_joins: []
  }

  join: view_02275 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02272.account_id} = ${view_02275.account_id} ;;
    required_joins: [view_02274]
  }

  join: view_02276 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02272.category} = ${view_02276.category} ;;
  }

  access_filter: {
    field: view_02272.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02272.is_deleted} = false ;;
}
