# Explore: explore_3842
# Auto-generated LookML Explore File

include: "/views/domain_27/view_11527.view.lkml"
include: "/views/domain_29/view_11529.view.lkml"
include: "/views/domain_30/view_11530.view.lkml"
include: "/views/domain_31/view_11531.view.lkml"

explore: explore_3842 {
  label: "Explore Explore 3842"
  description: "Comprehensive analytics explore joining base view_11527 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11527
  
  always_filter: {
    filters: [view_11527.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11527.created_at_date: "7 days"]
    unless: [view_11527.id, view_11527.status]
  }

  join: view_11529 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11527.user_id} = ${view_11529.id} ;;
    required_joins: []
  }

  join: view_11530 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11527.account_id} = ${view_11530.account_id} ;;
    required_joins: [view_11529]
  }

  join: view_11531 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11527.category} = ${view_11531.category} ;;
  }

  access_filter: {
    field: view_11527.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11527.is_deleted} = false ;;
}
