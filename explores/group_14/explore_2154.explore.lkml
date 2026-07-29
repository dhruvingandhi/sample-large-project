# Explore: explore_2154
# Auto-generated LookML Explore File

include: "/views/domain_13/view_06463.view.lkml"
include: "/views/domain_15/view_06465.view.lkml"
include: "/views/domain_16/view_06466.view.lkml"
include: "/views/domain_17/view_06467.view.lkml"

explore: explore_2154 {
  label: "Explore Explore 2154"
  description: "Comprehensive analytics explore joining base view_06463 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_06463
  
  always_filter: {
    filters: [view_06463.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06463.created_at_date: "7 days"]
    unless: [view_06463.id, view_06463.status]
  }

  join: view_06465 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06463.user_id} = ${view_06465.id} ;;
    required_joins: []
  }

  join: view_06466 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06463.account_id} = ${view_06466.account_id} ;;
    required_joins: [view_06465]
  }

  join: view_06467 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06463.category} = ${view_06467.category} ;;
  }

  access_filter: {
    field: view_06463.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06463.is_deleted} = false ;;
}
