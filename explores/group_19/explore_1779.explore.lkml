# Explore: explore_1779
# Auto-generated LookML Explore File

include: "/views/domain_38/view_05338.view.lkml"
include: "/views/domain_40/view_05340.view.lkml"
include: "/views/domain_41/view_05341.view.lkml"
include: "/views/domain_42/view_05342.view.lkml"

explore: explore_1779 {
  label: "Explore Explore 1779"
  description: "Comprehensive analytics explore joining base view_05338 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05338
  
  always_filter: {
    filters: [view_05338.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05338.created_at_date: "7 days"]
    unless: [view_05338.id, view_05338.status]
  }

  join: view_05340 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05338.user_id} = ${view_05340.id} ;;
    required_joins: []
  }

  join: view_05341 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05338.account_id} = ${view_05341.account_id} ;;
    required_joins: [view_05340]
  }

  join: view_05342 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05338.category} = ${view_05342.category} ;;
  }

  access_filter: {
    field: view_05338.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05338.is_deleted} = false ;;
}
