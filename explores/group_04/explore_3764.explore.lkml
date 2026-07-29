# Explore: explore_3764
# Auto-generated LookML Explore File

include: "/views/domain_43/view_11293.view.lkml"
include: "/views/domain_45/view_11295.view.lkml"
include: "/views/domain_46/view_11296.view.lkml"
include: "/views/domain_47/view_11297.view.lkml"

explore: explore_3764 {
  label: "Explore Explore 3764"
  description: "Comprehensive analytics explore joining base view_11293 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11293
  
  always_filter: {
    filters: [view_11293.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11293.created_at_date: "7 days"]
    unless: [view_11293.id, view_11293.status]
  }

  join: view_11295 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11293.user_id} = ${view_11295.id} ;;
    required_joins: []
  }

  join: view_11296 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11293.account_id} = ${view_11296.account_id} ;;
    required_joins: [view_11295]
  }

  join: view_11297 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11293.category} = ${view_11297.category} ;;
  }

  access_filter: {
    field: view_11293.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11293.is_deleted} = false ;;
}
