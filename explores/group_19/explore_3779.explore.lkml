# Explore: explore_3779
# Auto-generated LookML Explore File

include: "/views/domain_38/view_11338.view.lkml"
include: "/views/domain_40/view_11340.view.lkml"
include: "/views/domain_41/view_11341.view.lkml"
include: "/views/domain_42/view_11342.view.lkml"

explore: explore_3779 {
  label: "Explore Explore 3779"
  description: "Comprehensive analytics explore joining base view_11338 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_11338
  
  always_filter: {
    filters: [view_11338.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11338.created_at_date: "7 days"]
    unless: [view_11338.id, view_11338.status]
  }

  join: view_11340 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11338.user_id} = ${view_11340.id} ;;
    required_joins: []
  }

  join: view_11341 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11338.account_id} = ${view_11341.account_id} ;;
    required_joins: [view_11340]
  }

  join: view_11342 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11338.category} = ${view_11342.category} ;;
  }

  access_filter: {
    field: view_11338.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11338.is_deleted} = false ;;
}
