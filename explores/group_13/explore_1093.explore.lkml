# Explore: explore_1093
# Auto-generated LookML Explore File

include: "/views/domain_30/view_03280.view.lkml"
include: "/views/domain_32/view_03282.view.lkml"
include: "/views/domain_33/view_03283.view.lkml"
include: "/views/domain_34/view_03284.view.lkml"

explore: explore_1093 {
  label: "Explore Explore 1093"
  description: "Comprehensive analytics explore joining base view_03280 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03280
  
  always_filter: {
    filters: [view_03280.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03280.created_at_date: "7 days"]
    unless: [view_03280.id, view_03280.status]
  }

  join: view_03282 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03280.user_id} = ${view_03282.id} ;;
    required_joins: []
  }

  join: view_03283 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03280.account_id} = ${view_03283.account_id} ;;
    required_joins: [view_03282]
  }

  join: view_03284 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03280.category} = ${view_03284.category} ;;
  }

  access_filter: {
    field: view_03280.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03280.is_deleted} = false ;;
}
