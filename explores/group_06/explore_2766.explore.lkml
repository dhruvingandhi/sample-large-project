# Explore: explore_2766
# Auto-generated LookML Explore File

include: "/views/domain_49/view_08299.view.lkml"
include: "/views/domain_01/view_08301.view.lkml"
include: "/views/domain_02/view_08302.view.lkml"
include: "/views/domain_03/view_08303.view.lkml"

explore: explore_2766 {
  label: "Explore Explore 2766"
  description: "Comprehensive analytics explore joining base view_08299 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08299
  
  always_filter: {
    filters: [view_08299.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08299.created_at_date: "7 days"]
    unless: [view_08299.id, view_08299.status]
  }

  join: view_08301 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08299.user_id} = ${view_08301.id} ;;
    required_joins: []
  }

  join: view_08302 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08299.account_id} = ${view_08302.account_id} ;;
    required_joins: [view_08301]
  }

  join: view_08303 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08299.category} = ${view_08303.category} ;;
  }

  access_filter: {
    field: view_08299.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08299.is_deleted} = false ;;
}
