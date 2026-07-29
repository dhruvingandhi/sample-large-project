# Explore: explore_3198
# Auto-generated LookML Explore File

include: "/views/domain_45/view_09595.view.lkml"
include: "/views/domain_47/view_09597.view.lkml"
include: "/views/domain_48/view_09598.view.lkml"
include: "/views/domain_49/view_09599.view.lkml"

explore: explore_3198 {
  label: "Explore Explore 3198"
  description: "Comprehensive analytics explore joining base view_09595 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09595
  
  always_filter: {
    filters: [view_09595.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09595.created_at_date: "7 days"]
    unless: [view_09595.id, view_09595.status]
  }

  join: view_09597 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09595.user_id} = ${view_09597.id} ;;
    required_joins: []
  }

  join: view_09598 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09595.account_id} = ${view_09598.account_id} ;;
    required_joins: [view_09597]
  }

  join: view_09599 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09595.category} = ${view_09599.category} ;;
  }

  access_filter: {
    field: view_09595.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09595.is_deleted} = false ;;
}
