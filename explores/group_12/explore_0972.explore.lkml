# Explore: explore_0972
# Auto-generated LookML Explore File

include: "/views/domain_17/view_02917.view.lkml"
include: "/views/domain_19/view_02919.view.lkml"
include: "/views/domain_20/view_02920.view.lkml"
include: "/views/domain_21/view_02921.view.lkml"

explore: explore_0972 {
  label: "Explore Explore 0972"
  description: "Comprehensive analytics explore joining base view_02917 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_02917
  
  always_filter: {
    filters: [view_02917.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02917.created_at_date: "7 days"]
    unless: [view_02917.id, view_02917.status]
  }

  join: view_02919 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02917.user_id} = ${view_02919.id} ;;
    required_joins: []
  }

  join: view_02920 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02917.account_id} = ${view_02920.account_id} ;;
    required_joins: [view_02919]
  }

  join: view_02921 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02917.category} = ${view_02921.category} ;;
  }

  access_filter: {
    field: view_02917.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02917.is_deleted} = false ;;
}
