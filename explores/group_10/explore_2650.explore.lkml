# Explore: explore_2650
# Auto-generated LookML Explore File

include: "/views/domain_01/view_07951.view.lkml"
include: "/views/domain_03/view_07953.view.lkml"
include: "/views/domain_04/view_07954.view.lkml"
include: "/views/domain_05/view_07955.view.lkml"

explore: explore_2650 {
  label: "Explore Explore 2650"
  description: "Comprehensive analytics explore joining base view_07951 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_07951
  
  always_filter: {
    filters: [view_07951.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07951.created_at_date: "7 days"]
    unless: [view_07951.id, view_07951.status]
  }

  join: view_07953 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07951.user_id} = ${view_07953.id} ;;
    required_joins: []
  }

  join: view_07954 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07951.account_id} = ${view_07954.account_id} ;;
    required_joins: [view_07953]
  }

  join: view_07955 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07951.category} = ${view_07955.category} ;;
  }

  access_filter: {
    field: view_07951.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07951.is_deleted} = false ;;
}
