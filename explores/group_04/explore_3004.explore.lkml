# Explore: explore_3004
# Auto-generated LookML Explore File

include: "/views/domain_13/view_09013.view.lkml"
include: "/views/domain_15/view_09015.view.lkml"
include: "/views/domain_16/view_09016.view.lkml"
include: "/views/domain_17/view_09017.view.lkml"

explore: explore_3004 {
  label: "Explore Explore 3004"
  description: "Comprehensive analytics explore joining base view_09013 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09013
  
  always_filter: {
    filters: [view_09013.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09013.created_at_date: "7 days"]
    unless: [view_09013.id, view_09013.status]
  }

  join: view_09015 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09013.user_id} = ${view_09015.id} ;;
    required_joins: []
  }

  join: view_09016 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09013.account_id} = ${view_09016.account_id} ;;
    required_joins: [view_09015]
  }

  join: view_09017 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09013.category} = ${view_09017.category} ;;
  }

  access_filter: {
    field: view_09013.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09013.is_deleted} = false ;;
}
