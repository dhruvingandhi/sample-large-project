# Explore: explore_0779
# Auto-generated LookML Explore File

include: "/views/domain_38/view_02338.view.lkml"
include: "/views/domain_40/view_02340.view.lkml"
include: "/views/domain_41/view_02341.view.lkml"
include: "/views/domain_42/view_02342.view.lkml"

explore: explore_0779 {
  label: "Explore Explore 0779"
  description: "Comprehensive analytics explore joining base view_02338 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02338
  
  always_filter: {
    filters: [view_02338.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02338.created_at_date: "7 days"]
    unless: [view_02338.id, view_02338.status]
  }

  join: view_02340 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02338.user_id} = ${view_02340.id} ;;
    required_joins: []
  }

  join: view_02341 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02338.account_id} = ${view_02341.account_id} ;;
    required_joins: [view_02340]
  }

  join: view_02342 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02338.category} = ${view_02342.category} ;;
  }

  access_filter: {
    field: view_02338.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02338.is_deleted} = false ;;
}
