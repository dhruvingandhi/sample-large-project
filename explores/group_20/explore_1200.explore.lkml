# Explore: explore_1200
# Auto-generated LookML Explore File

include: "/views/domain_01/view_03601.view.lkml"
include: "/views/domain_03/view_03603.view.lkml"
include: "/views/domain_04/view_03604.view.lkml"
include: "/views/domain_05/view_03605.view.lkml"

explore: explore_1200 {
  label: "Explore Explore 1200"
  description: "Comprehensive analytics explore joining base view_03601 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03601
  
  always_filter: {
    filters: [view_03601.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03601.created_at_date: "7 days"]
    unless: [view_03601.id, view_03601.status]
  }

  join: view_03603 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03601.user_id} = ${view_03603.id} ;;
    required_joins: []
  }

  join: view_03604 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03601.account_id} = ${view_03604.account_id} ;;
    required_joins: [view_03603]
  }

  join: view_03605 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03601.category} = ${view_03605.category} ;;
  }

  access_filter: {
    field: view_03601.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03601.is_deleted} = false ;;
}
