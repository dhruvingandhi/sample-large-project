# Explore: explore_0472
# Auto-generated LookML Explore File

include: "/views/domain_17/view_01417.view.lkml"
include: "/views/domain_19/view_01419.view.lkml"
include: "/views/domain_20/view_01420.view.lkml"
include: "/views/domain_21/view_01421.view.lkml"

explore: explore_0472 {
  label: "Explore Explore 0472"
  description: "Comprehensive analytics explore joining base view_01417 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01417
  
  always_filter: {
    filters: [view_01417.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01417.created_at_date: "7 days"]
    unless: [view_01417.id, view_01417.status]
  }

  join: view_01419 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01417.user_id} = ${view_01419.id} ;;
    required_joins: []
  }

  join: view_01420 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01417.account_id} = ${view_01420.account_id} ;;
    required_joins: [view_01419]
  }

  join: view_01421 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01417.category} = ${view_01421.category} ;;
  }

  access_filter: {
    field: view_01417.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01417.is_deleted} = false ;;
}
