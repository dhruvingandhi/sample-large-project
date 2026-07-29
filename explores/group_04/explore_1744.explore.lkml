# Explore: explore_1744
# Auto-generated LookML Explore File

include: "/views/domain_33/view_05233.view.lkml"
include: "/views/domain_35/view_05235.view.lkml"
include: "/views/domain_36/view_05236.view.lkml"
include: "/views/domain_37/view_05237.view.lkml"

explore: explore_1744 {
  label: "Explore Explore 1744"
  description: "Comprehensive analytics explore joining base view_05233 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_05233
  
  always_filter: {
    filters: [view_05233.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05233.created_at_date: "7 days"]
    unless: [view_05233.id, view_05233.status]
  }

  join: view_05235 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05233.user_id} = ${view_05235.id} ;;
    required_joins: []
  }

  join: view_05236 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05233.account_id} = ${view_05236.account_id} ;;
    required_joins: [view_05235]
  }

  join: view_05237 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05233.category} = ${view_05237.category} ;;
  }

  access_filter: {
    field: view_05233.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05233.is_deleted} = false ;;
}
