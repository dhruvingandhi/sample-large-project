# Explore: explore_3255
# Auto-generated LookML Explore File

include: "/views/domain_16/view_09766.view.lkml"
include: "/views/domain_18/view_09768.view.lkml"
include: "/views/domain_19/view_09769.view.lkml"
include: "/views/domain_20/view_09770.view.lkml"

explore: explore_3255 {
  label: "Explore Explore 3255"
  description: "Comprehensive analytics explore joining base view_09766 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09766
  
  always_filter: {
    filters: [view_09766.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09766.created_at_date: "7 days"]
    unless: [view_09766.id, view_09766.status]
  }

  join: view_09768 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09766.user_id} = ${view_09768.id} ;;
    required_joins: []
  }

  join: view_09769 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09766.account_id} = ${view_09769.account_id} ;;
    required_joins: [view_09768]
  }

  join: view_09770 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09766.category} = ${view_09770.category} ;;
  }

  access_filter: {
    field: view_09766.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09766.is_deleted} = false ;;
}
