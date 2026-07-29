# Explore: explore_2333
# Auto-generated LookML Explore File

include: "/views/domain_50/view_07000.view.lkml"
include: "/views/domain_02/view_07002.view.lkml"
include: "/views/domain_03/view_07003.view.lkml"
include: "/views/domain_04/view_07004.view.lkml"

explore: explore_2333 {
  label: "Explore Explore 2333"
  description: "Comprehensive analytics explore joining base view_07000 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07000
  
  always_filter: {
    filters: [view_07000.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07000.created_at_date: "7 days"]
    unless: [view_07000.id, view_07000.status]
  }

  join: view_07002 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07000.user_id} = ${view_07002.id} ;;
    required_joins: []
  }

  join: view_07003 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07000.account_id} = ${view_07003.account_id} ;;
    required_joins: [view_07002]
  }

  join: view_07004 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07000.category} = ${view_07004.category} ;;
  }

  access_filter: {
    field: view_07000.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07000.is_deleted} = false ;;
}
