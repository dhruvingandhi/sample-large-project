# Explore: explore_3383
# Auto-generated LookML Explore File

include: "/views/domain_50/view_10150.view.lkml"
include: "/views/domain_02/view_10152.view.lkml"
include: "/views/domain_03/view_10153.view.lkml"
include: "/views/domain_04/view_10154.view.lkml"

explore: explore_3383 {
  label: "Explore Explore 3383"
  description: "Comprehensive analytics explore joining base view_10150 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_10150
  
  always_filter: {
    filters: [view_10150.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10150.created_at_date: "7 days"]
    unless: [view_10150.id, view_10150.status]
  }

  join: view_10152 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10150.user_id} = ${view_10152.id} ;;
    required_joins: []
  }

  join: view_10153 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10150.account_id} = ${view_10153.account_id} ;;
    required_joins: [view_10152]
  }

  join: view_10154 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10150.category} = ${view_10154.category} ;;
  }

  access_filter: {
    field: view_10150.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10150.is_deleted} = false ;;
}
