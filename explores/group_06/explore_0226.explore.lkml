# Explore: explore_0226
# Auto-generated LookML Explore File

include: "/views/domain_29/view_00679.view.lkml"
include: "/views/domain_31/view_00681.view.lkml"
include: "/views/domain_32/view_00682.view.lkml"
include: "/views/domain_33/view_00683.view.lkml"

explore: explore_0226 {
  label: "Explore Explore 0226"
  description: "Comprehensive analytics explore joining base view_00679 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00679
  
  always_filter: {
    filters: [view_00679.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00679.created_at_date: "7 days"]
    unless: [view_00679.id, view_00679.status]
  }

  join: view_00681 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00679.user_id} = ${view_00681.id} ;;
    required_joins: []
  }

  join: view_00682 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00679.account_id} = ${view_00682.account_id} ;;
    required_joins: [view_00681]
  }

  join: view_00683 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00679.category} = ${view_00683.category} ;;
  }

  access_filter: {
    field: view_00679.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00679.is_deleted} = false ;;
}
