# Explore: explore_2789
# Auto-generated LookML Explore File

include: "/views/domain_18/view_08368.view.lkml"
include: "/views/domain_20/view_08370.view.lkml"
include: "/views/domain_21/view_08371.view.lkml"
include: "/views/domain_22/view_08372.view.lkml"

explore: explore_2789 {
  label: "Explore Explore 2789"
  description: "Comprehensive analytics explore joining base view_08368 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08368
  
  always_filter: {
    filters: [view_08368.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08368.created_at_date: "7 days"]
    unless: [view_08368.id, view_08368.status]
  }

  join: view_08370 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08368.user_id} = ${view_08370.id} ;;
    required_joins: []
  }

  join: view_08371 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08368.account_id} = ${view_08371.account_id} ;;
    required_joins: [view_08370]
  }

  join: view_08372 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08368.category} = ${view_08372.category} ;;
  }

  access_filter: {
    field: view_08368.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08368.is_deleted} = false ;;
}
