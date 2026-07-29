# Explore: explore_1179
# Auto-generated LookML Explore File

include: "/views/domain_38/view_03538.view.lkml"
include: "/views/domain_40/view_03540.view.lkml"
include: "/views/domain_41/view_03541.view.lkml"
include: "/views/domain_42/view_03542.view.lkml"

explore: explore_1179 {
  label: "Explore Explore 1179"
  description: "Comprehensive analytics explore joining base view_03538 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03538
  
  always_filter: {
    filters: [view_03538.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03538.created_at_date: "7 days"]
    unless: [view_03538.id, view_03538.status]
  }

  join: view_03540 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03538.user_id} = ${view_03540.id} ;;
    required_joins: []
  }

  join: view_03541 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03538.account_id} = ${view_03541.account_id} ;;
    required_joins: [view_03540]
  }

  join: view_03542 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03538.category} = ${view_03542.category} ;;
  }

  access_filter: {
    field: view_03538.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03538.is_deleted} = false ;;
}
