# Explore: explore_1972
# Auto-generated LookML Explore File

include: "/views/domain_17/view_05917.view.lkml"
include: "/views/domain_19/view_05919.view.lkml"
include: "/views/domain_20/view_05920.view.lkml"
include: "/views/domain_21/view_05921.view.lkml"

explore: explore_1972 {
  label: "Explore Explore 1972"
  description: "Comprehensive analytics explore joining base view_05917 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05917
  
  always_filter: {
    filters: [view_05917.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05917.created_at_date: "7 days"]
    unless: [view_05917.id, view_05917.status]
  }

  join: view_05919 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05917.user_id} = ${view_05919.id} ;;
    required_joins: []
  }

  join: view_05920 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05917.account_id} = ${view_05920.account_id} ;;
    required_joins: [view_05919]
  }

  join: view_05921 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05917.category} = ${view_05921.category} ;;
  }

  access_filter: {
    field: view_05917.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05917.is_deleted} = false ;;
}
