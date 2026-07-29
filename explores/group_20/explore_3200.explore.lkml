# Explore: explore_3200
# Auto-generated LookML Explore File

include: "/views/domain_01/view_09601.view.lkml"
include: "/views/domain_03/view_09603.view.lkml"
include: "/views/domain_04/view_09604.view.lkml"
include: "/views/domain_05/view_09605.view.lkml"

explore: explore_3200 {
  label: "Explore Explore 3200"
  description: "Comprehensive analytics explore joining base view_09601 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09601
  
  always_filter: {
    filters: [view_09601.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09601.created_at_date: "7 days"]
    unless: [view_09601.id, view_09601.status]
  }

  join: view_09603 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09601.user_id} = ${view_09603.id} ;;
    required_joins: []
  }

  join: view_09604 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09601.account_id} = ${view_09604.account_id} ;;
    required_joins: [view_09603]
  }

  join: view_09605 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09601.category} = ${view_09605.category} ;;
  }

  access_filter: {
    field: view_09601.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09601.is_deleted} = false ;;
}
