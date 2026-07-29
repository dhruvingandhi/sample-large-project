# Explore: explore_1133
# Auto-generated LookML Explore File

include: "/views/domain_50/view_03400.view.lkml"
include: "/views/domain_02/view_03402.view.lkml"
include: "/views/domain_03/view_03403.view.lkml"
include: "/views/domain_04/view_03404.view.lkml"

explore: explore_1133 {
  label: "Explore Explore 1133"
  description: "Comprehensive analytics explore joining base view_03400 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_03400
  
  always_filter: {
    filters: [view_03400.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03400.created_at_date: "7 days"]
    unless: [view_03400.id, view_03400.status]
  }

  join: view_03402 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03400.user_id} = ${view_03402.id} ;;
    required_joins: []
  }

  join: view_03403 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03400.account_id} = ${view_03403.account_id} ;;
    required_joins: [view_03402]
  }

  join: view_03404 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03400.category} = ${view_03404.category} ;;
  }

  access_filter: {
    field: view_03400.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03400.is_deleted} = false ;;
}
