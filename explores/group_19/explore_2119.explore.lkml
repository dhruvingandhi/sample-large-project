# Explore: explore_2119
# Auto-generated LookML Explore File

include: "/views/domain_08/view_06358.view.lkml"
include: "/views/domain_10/view_06360.view.lkml"
include: "/views/domain_11/view_06361.view.lkml"
include: "/views/domain_12/view_06362.view.lkml"

explore: explore_2119 {
  label: "Explore Explore 2119"
  description: "Comprehensive analytics explore joining base view_06358 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_06358
  
  always_filter: {
    filters: [view_06358.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06358.created_at_date: "7 days"]
    unless: [view_06358.id, view_06358.status]
  }

  join: view_06360 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06358.user_id} = ${view_06360.id} ;;
    required_joins: []
  }

  join: view_06361 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06358.account_id} = ${view_06361.account_id} ;;
    required_joins: [view_06360]
  }

  join: view_06362 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06358.category} = ${view_06362.category} ;;
  }

  access_filter: {
    field: view_06358.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06358.is_deleted} = false ;;
}
