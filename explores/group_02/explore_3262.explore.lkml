# Explore: explore_3262
# Auto-generated LookML Explore File

include: "/views/domain_37/view_09787.view.lkml"
include: "/views/domain_39/view_09789.view.lkml"
include: "/views/domain_40/view_09790.view.lkml"
include: "/views/domain_41/view_09791.view.lkml"

explore: explore_3262 {
  label: "Explore Explore 3262"
  description: "Comprehensive analytics explore joining base view_09787 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09787
  
  always_filter: {
    filters: [view_09787.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09787.created_at_date: "7 days"]
    unless: [view_09787.id, view_09787.status]
  }

  join: view_09789 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09787.user_id} = ${view_09789.id} ;;
    required_joins: []
  }

  join: view_09790 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09787.account_id} = ${view_09790.account_id} ;;
    required_joins: [view_09789]
  }

  join: view_09791 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09787.category} = ${view_09791.category} ;;
  }

  access_filter: {
    field: view_09787.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09787.is_deleted} = false ;;
}
