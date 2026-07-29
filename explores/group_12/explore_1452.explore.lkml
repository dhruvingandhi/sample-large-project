# Explore: explore_1452
# Auto-generated LookML Explore File

include: "/views/domain_07/view_04357.view.lkml"
include: "/views/domain_09/view_04359.view.lkml"
include: "/views/domain_10/view_04360.view.lkml"
include: "/views/domain_11/view_04361.view.lkml"

explore: explore_1452 {
  label: "Explore Explore 1452"
  description: "Comprehensive analytics explore joining base view_04357 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_04357
  
  always_filter: {
    filters: [view_04357.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04357.created_at_date: "7 days"]
    unless: [view_04357.id, view_04357.status]
  }

  join: view_04359 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04357.user_id} = ${view_04359.id} ;;
    required_joins: []
  }

  join: view_04360 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04357.account_id} = ${view_04360.account_id} ;;
    required_joins: [view_04359]
  }

  join: view_04361 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04357.category} = ${view_04361.category} ;;
  }

  access_filter: {
    field: view_04357.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04357.is_deleted} = false ;;
}
