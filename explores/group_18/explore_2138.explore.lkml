# Update for 2000 file diff target
# Explore: explore_2138
# Auto-generated LookML Explore File

include: "/views/domain_15/view_06415.view.lkml"
include: "/views/domain_17/view_06417.view.lkml"
include: "/views/domain_18/view_06418.view.lkml"
include: "/views/domain_19/view_06419.view.lkml"

explore: explore_2138 {
  label: "Explore Explore 2138"
  description: "Comprehensive analytics explore joining base view_06415 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06415
  
  always_filter: {
    filters: [view_06415.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06415.created_at_date: "7 days"]
    unless: [view_06415.id, view_06415.status]
  }

  join: view_06417 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06415.user_id} = ${view_06417.id} ;;
    required_joins: []
  }

  join: view_06418 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06415.account_id} = ${view_06418.account_id} ;;
    required_joins: [view_06417]
  }

  join: view_06419 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06415.category} = ${view_06419.category} ;;
  }

  access_filter: {
    field: view_06415.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06415.is_deleted} = false ;;
}
