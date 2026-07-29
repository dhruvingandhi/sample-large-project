# Explore: explore_3797
# Auto-generated LookML Explore File

include: "/views/domain_42/view_11392.view.lkml"
include: "/views/domain_44/view_11394.view.lkml"
include: "/views/domain_45/view_11395.view.lkml"
include: "/views/domain_46/view_11396.view.lkml"

explore: explore_3797 {
  label: "Explore Explore 3797"
  description: "Comprehensive analytics explore joining base view_11392 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_11392
  
  always_filter: {
    filters: [view_11392.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11392.created_at_date: "7 days"]
    unless: [view_11392.id, view_11392.status]
  }

  join: view_11394 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11392.user_id} = ${view_11394.id} ;;
    required_joins: []
  }

  join: view_11395 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11392.account_id} = ${view_11395.account_id} ;;
    required_joins: [view_11394]
  }

  join: view_11396 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11392.category} = ${view_11396.category} ;;
  }

  access_filter: {
    field: view_11392.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11392.is_deleted} = false ;;
}
