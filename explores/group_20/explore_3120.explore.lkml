# Update for 2000 file diff target
# Explore: explore_3120
# Auto-generated LookML Explore File

include: "/views/domain_11/view_09361.view.lkml"
include: "/views/domain_13/view_09363.view.lkml"
include: "/views/domain_14/view_09364.view.lkml"
include: "/views/domain_15/view_09365.view.lkml"

explore: explore_3120 {
  label: "Explore Explore 3120"
  description: "Comprehensive analytics explore joining base view_09361 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09361
  
  always_filter: {
    filters: [view_09361.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09361.created_at_date: "7 days"]
    unless: [view_09361.id, view_09361.status]
  }

  join: view_09363 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09361.user_id} = ${view_09363.id} ;;
    required_joins: []
  }

  join: view_09364 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09361.account_id} = ${view_09364.account_id} ;;
    required_joins: [view_09363]
  }

  join: view_09365 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09361.category} = ${view_09365.category} ;;
  }

  access_filter: {
    field: view_09361.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09361.is_deleted} = false ;;
}
