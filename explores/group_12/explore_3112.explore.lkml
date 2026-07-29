# Explore: explore_3112
# Auto-generated LookML Explore File

include: "/views/domain_37/view_09337.view.lkml"
include: "/views/domain_39/view_09339.view.lkml"
include: "/views/domain_40/view_09340.view.lkml"
include: "/views/domain_41/view_09341.view.lkml"

explore: explore_3112 {
  label: "Explore Explore 3112"
  description: "Comprehensive analytics explore joining base view_09337 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09337
  
  always_filter: {
    filters: [view_09337.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09337.created_at_date: "7 days"]
    unless: [view_09337.id, view_09337.status]
  }

  join: view_09339 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09337.user_id} = ${view_09339.id} ;;
    required_joins: []
  }

  join: view_09340 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09337.account_id} = ${view_09340.account_id} ;;
    required_joins: [view_09339]
  }

  join: view_09341 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09337.category} = ${view_09341.category} ;;
  }

  access_filter: {
    field: view_09337.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09337.is_deleted} = false ;;
}
