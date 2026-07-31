# Update for 2000 file diff target
# Explore: explore_0200
# Auto-generated LookML Explore File

include: "/views/domain_01/view_00601.view.lkml"
include: "/views/domain_03/view_00603.view.lkml"
include: "/views/domain_04/view_00604.view.lkml"
include: "/views/domain_05/view_00605.view.lkml"

explore: explore_0200 {
  label: "Explore Explore 0200"
  description: "Comprehensive analytics explore joining base view_00601 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00601
  
  always_filter: {
    filters: [view_00601.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00601.created_at_date: "7 days"]
    unless: [view_00601.id, view_00601.status]
  }

  join: view_00603 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00601.user_id} = ${view_00603.id} ;;
    required_joins: []
  }

  join: view_00604 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00601.account_id} = ${view_00604.account_id} ;;
    required_joins: [view_00603]
  }

  join: view_00605 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00601.category} = ${view_00605.category} ;;
  }

  access_filter: {
    field: view_00601.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00601.is_deleted} = false ;;
}
