# Explore: explore_0261
# Auto-generated LookML Explore File

include: "/views/domain_34/view_00784.view.lkml"
include: "/views/domain_36/view_00786.view.lkml"
include: "/views/domain_37/view_00787.view.lkml"
include: "/views/domain_38/view_00788.view.lkml"

explore: explore_0261 {
  label: "Explore Explore 0261"
  description: "Comprehensive analytics explore joining base view_00784 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00784
  
  always_filter: {
    filters: [view_00784.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00784.created_at_date: "7 days"]
    unless: [view_00784.id, view_00784.status]
  }

  join: view_00786 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00784.user_id} = ${view_00786.id} ;;
    required_joins: []
  }

  join: view_00787 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00784.account_id} = ${view_00787.account_id} ;;
    required_joins: [view_00786]
  }

  join: view_00788 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00784.category} = ${view_00788.category} ;;
  }

  access_filter: {
    field: view_00784.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00784.is_deleted} = false ;;
}
