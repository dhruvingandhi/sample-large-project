# Explore: explore_2004
# Auto-generated LookML Explore File

include: "/views/domain_13/view_06013.view.lkml"
include: "/views/domain_15/view_06015.view.lkml"
include: "/views/domain_16/view_06016.view.lkml"
include: "/views/domain_17/view_06017.view.lkml"

explore: explore_2004 {
  label: "Explore Explore 2004"
  description: "Comprehensive analytics explore joining base view_06013 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06013
  
  always_filter: {
    filters: [view_06013.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06013.created_at_date: "7 days"]
    unless: [view_06013.id, view_06013.status]
  }

  join: view_06015 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06013.user_id} = ${view_06015.id} ;;
    required_joins: []
  }

  join: view_06016 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06013.account_id} = ${view_06016.account_id} ;;
    required_joins: [view_06015]
  }

  join: view_06017 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06013.category} = ${view_06017.category} ;;
  }

  access_filter: {
    field: view_06013.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06013.is_deleted} = false ;;
}
