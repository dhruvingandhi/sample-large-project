# Explore: explore_1036
# Auto-generated LookML Explore File

include: "/views/domain_09/view_03109.view.lkml"
include: "/views/domain_11/view_03111.view.lkml"
include: "/views/domain_12/view_03112.view.lkml"
include: "/views/domain_13/view_03113.view.lkml"

explore: explore_1036 {
  label: "Explore Explore 1036"
  description: "Comprehensive analytics explore joining base view_03109 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03109
  
  always_filter: {
    filters: [view_03109.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03109.created_at_date: "7 days"]
    unless: [view_03109.id, view_03109.status]
  }

  join: view_03111 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03109.user_id} = ${view_03111.id} ;;
    required_joins: []
  }

  join: view_03112 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03109.account_id} = ${view_03112.account_id} ;;
    required_joins: [view_03111]
  }

  join: view_03113 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03109.category} = ${view_03113.category} ;;
  }

  access_filter: {
    field: view_03109.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03109.is_deleted} = false ;;
}
