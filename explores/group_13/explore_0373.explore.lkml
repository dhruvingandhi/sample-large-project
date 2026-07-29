# Explore: explore_0373
# Auto-generated LookML Explore File

include: "/views/domain_20/view_01120.view.lkml"
include: "/views/domain_22/view_01122.view.lkml"
include: "/views/domain_23/view_01123.view.lkml"
include: "/views/domain_24/view_01124.view.lkml"

explore: explore_0373 {
  label: "Explore Explore 0373"
  description: "Comprehensive analytics explore joining base view_01120 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01120
  
  always_filter: {
    filters: [view_01120.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01120.created_at_date: "7 days"]
    unless: [view_01120.id, view_01120.status]
  }

  join: view_01122 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01120.user_id} = ${view_01122.id} ;;
    required_joins: []
  }

  join: view_01123 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01120.account_id} = ${view_01123.account_id} ;;
    required_joins: [view_01122]
  }

  join: view_01124 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01120.category} = ${view_01124.category} ;;
  }

  access_filter: {
    field: view_01120.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01120.is_deleted} = false ;;
}
