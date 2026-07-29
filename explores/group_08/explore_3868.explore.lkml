# Explore: explore_3868
# Auto-generated LookML Explore File

include: "/views/domain_05/view_11605.view.lkml"
include: "/views/domain_07/view_11607.view.lkml"
include: "/views/domain_08/view_11608.view.lkml"
include: "/views/domain_09/view_11609.view.lkml"

explore: explore_3868 {
  label: "Explore Explore 3868"
  description: "Comprehensive analytics explore joining base view_11605 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11605
  
  always_filter: {
    filters: [view_11605.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11605.created_at_date: "7 days"]
    unless: [view_11605.id, view_11605.status]
  }

  join: view_11607 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11605.user_id} = ${view_11607.id} ;;
    required_joins: []
  }

  join: view_11608 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11605.account_id} = ${view_11608.account_id} ;;
    required_joins: [view_11607]
  }

  join: view_11609 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11605.category} = ${view_11609.category} ;;
  }

  access_filter: {
    field: view_11605.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11605.is_deleted} = false ;;
}
