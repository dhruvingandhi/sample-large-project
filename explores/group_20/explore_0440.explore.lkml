# Explore: explore_0440
# Auto-generated LookML Explore File

include: "/views/domain_21/view_01321.view.lkml"
include: "/views/domain_23/view_01323.view.lkml"
include: "/views/domain_24/view_01324.view.lkml"
include: "/views/domain_25/view_01325.view.lkml"

explore: explore_0440 {
  label: "Explore Explore 0440"
  description: "Comprehensive analytics explore joining base view_01321 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01321
  
  always_filter: {
    filters: [view_01321.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01321.created_at_date: "7 days"]
    unless: [view_01321.id, view_01321.status]
  }

  join: view_01323 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01321.user_id} = ${view_01323.id} ;;
    required_joins: []
  }

  join: view_01324 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01321.account_id} = ${view_01324.account_id} ;;
    required_joins: [view_01323]
  }

  join: view_01325 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01321.category} = ${view_01325.category} ;;
  }

  access_filter: {
    field: view_01321.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01321.is_deleted} = false ;;
}
