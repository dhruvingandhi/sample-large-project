# Explore: explore_1842
# Auto-generated LookML Explore File

include: "/views/domain_27/view_05527.view.lkml"
include: "/views/domain_29/view_05529.view.lkml"
include: "/views/domain_30/view_05530.view.lkml"
include: "/views/domain_31/view_05531.view.lkml"

explore: explore_1842 {
  label: "Explore Explore 1842"
  description: "Comprehensive analytics explore joining base view_05527 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_05527
  
  always_filter: {
    filters: [view_05527.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05527.created_at_date: "7 days"]
    unless: [view_05527.id, view_05527.status]
  }

  join: view_05529 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05527.user_id} = ${view_05529.id} ;;
    required_joins: []
  }

  join: view_05530 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05527.account_id} = ${view_05530.account_id} ;;
    required_joins: [view_05529]
  }

  join: view_05531 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05527.category} = ${view_05531.category} ;;
  }

  access_filter: {
    field: view_05527.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05527.is_deleted} = false ;;
}
