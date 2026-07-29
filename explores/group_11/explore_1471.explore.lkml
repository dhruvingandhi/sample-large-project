# Explore: explore_1471
# Auto-generated LookML Explore File

include: "/views/domain_14/view_04414.view.lkml"
include: "/views/domain_16/view_04416.view.lkml"
include: "/views/domain_17/view_04417.view.lkml"
include: "/views/domain_18/view_04418.view.lkml"

explore: explore_1471 {
  label: "Explore Explore 1471"
  description: "Comprehensive analytics explore joining base view_04414 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_04414
  
  always_filter: {
    filters: [view_04414.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04414.created_at_date: "7 days"]
    unless: [view_04414.id, view_04414.status]
  }

  join: view_04416 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04414.user_id} = ${view_04416.id} ;;
    required_joins: []
  }

  join: view_04417 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04414.account_id} = ${view_04417.account_id} ;;
    required_joins: [view_04416]
  }

  join: view_04418 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04414.category} = ${view_04418.category} ;;
  }

  access_filter: {
    field: view_04414.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04414.is_deleted} = false ;;
}
