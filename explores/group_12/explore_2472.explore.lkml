# Explore: explore_2472
# Auto-generated LookML Explore File

include: "/views/domain_17/view_07417.view.lkml"
include: "/views/domain_19/view_07419.view.lkml"
include: "/views/domain_20/view_07420.view.lkml"
include: "/views/domain_21/view_07421.view.lkml"

explore: explore_2472 {
  label: "Explore Explore 2472"
  description: "Comprehensive analytics explore joining base view_07417 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_07417
  
  always_filter: {
    filters: [view_07417.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07417.created_at_date: "7 days"]
    unless: [view_07417.id, view_07417.status]
  }

  join: view_07419 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07417.user_id} = ${view_07419.id} ;;
    required_joins: []
  }

  join: view_07420 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07417.account_id} = ${view_07420.account_id} ;;
    required_joins: [view_07419]
  }

  join: view_07421 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07417.category} = ${view_07421.category} ;;
  }

  access_filter: {
    field: view_07417.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07417.is_deleted} = false ;;
}
