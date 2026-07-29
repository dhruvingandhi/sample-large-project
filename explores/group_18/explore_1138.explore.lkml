# Explore: explore_1138
# Auto-generated LookML Explore File

include: "/views/domain_15/view_03415.view.lkml"
include: "/views/domain_17/view_03417.view.lkml"
include: "/views/domain_18/view_03418.view.lkml"
include: "/views/domain_19/view_03419.view.lkml"

explore: explore_1138 {
  label: "Explore Explore 1138"
  description: "Comprehensive analytics explore joining base view_03415 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03415
  
  always_filter: {
    filters: [view_03415.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03415.created_at_date: "7 days"]
    unless: [view_03415.id, view_03415.status]
  }

  join: view_03417 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03415.user_id} = ${view_03417.id} ;;
    required_joins: []
  }

  join: view_03418 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03415.account_id} = ${view_03418.account_id} ;;
    required_joins: [view_03417]
  }

  join: view_03419 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03415.category} = ${view_03419.category} ;;
  }

  access_filter: {
    field: view_03415.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03415.is_deleted} = false ;;
}
