# Explore: explore_3119
# Auto-generated LookML Explore File

include: "/views/domain_08/view_09358.view.lkml"
include: "/views/domain_10/view_09360.view.lkml"
include: "/views/domain_11/view_09361.view.lkml"
include: "/views/domain_12/view_09362.view.lkml"

explore: explore_3119 {
  label: "Explore Explore 3119"
  description: "Comprehensive analytics explore joining base view_09358 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09358
  
  always_filter: {
    filters: [view_09358.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09358.created_at_date: "7 days"]
    unless: [view_09358.id, view_09358.status]
  }

  join: view_09360 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09358.user_id} = ${view_09360.id} ;;
    required_joins: []
  }

  join: view_09361 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09358.account_id} = ${view_09361.account_id} ;;
    required_joins: [view_09360]
  }

  join: view_09362 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09358.category} = ${view_09362.category} ;;
  }

  access_filter: {
    field: view_09358.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09358.is_deleted} = false ;;
}
