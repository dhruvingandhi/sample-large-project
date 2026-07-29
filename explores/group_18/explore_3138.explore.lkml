# Explore: explore_3138
# Auto-generated LookML Explore File

include: "/views/domain_15/view_09415.view.lkml"
include: "/views/domain_17/view_09417.view.lkml"
include: "/views/domain_18/view_09418.view.lkml"
include: "/views/domain_19/view_09419.view.lkml"

explore: explore_3138 {
  label: "Explore Explore 3138"
  description: "Comprehensive analytics explore joining base view_09415 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09415
  
  always_filter: {
    filters: [view_09415.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09415.created_at_date: "7 days"]
    unless: [view_09415.id, view_09415.status]
  }

  join: view_09417 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09415.user_id} = ${view_09417.id} ;;
    required_joins: []
  }

  join: view_09418 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09415.account_id} = ${view_09418.account_id} ;;
    required_joins: [view_09417]
  }

  join: view_09419 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09415.category} = ${view_09419.category} ;;
  }

  access_filter: {
    field: view_09415.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09415.is_deleted} = false ;;
}
