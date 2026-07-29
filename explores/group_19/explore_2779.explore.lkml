# Explore: explore_2779
# Auto-generated LookML Explore File

include: "/views/domain_38/view_08338.view.lkml"
include: "/views/domain_40/view_08340.view.lkml"
include: "/views/domain_41/view_08341.view.lkml"
include: "/views/domain_42/view_08342.view.lkml"

explore: explore_2779 {
  label: "Explore Explore 2779"
  description: "Comprehensive analytics explore joining base view_08338 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_08338
  
  always_filter: {
    filters: [view_08338.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08338.created_at_date: "7 days"]
    unless: [view_08338.id, view_08338.status]
  }

  join: view_08340 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08338.user_id} = ${view_08340.id} ;;
    required_joins: []
  }

  join: view_08341 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08338.account_id} = ${view_08341.account_id} ;;
    required_joins: [view_08340]
  }

  join: view_08342 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08338.category} = ${view_08342.category} ;;
  }

  access_filter: {
    field: view_08338.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08338.is_deleted} = false ;;
}
