# Explore: explore_1100
# Auto-generated LookML Explore File

include: "/views/domain_01/view_03301.view.lkml"
include: "/views/domain_03/view_03303.view.lkml"
include: "/views/domain_04/view_03304.view.lkml"
include: "/views/domain_05/view_03305.view.lkml"

explore: explore_1100 {
  label: "Explore Explore 1100"
  description: "Comprehensive analytics explore joining base view_03301 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03301
  
  always_filter: {
    filters: [view_03301.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03301.created_at_date: "7 days"]
    unless: [view_03301.id, view_03301.status]
  }

  join: view_03303 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03301.user_id} = ${view_03303.id} ;;
    required_joins: []
  }

  join: view_03304 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03301.account_id} = ${view_03304.account_id} ;;
    required_joins: [view_03303]
  }

  join: view_03305 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03301.category} = ${view_03305.category} ;;
  }

  access_filter: {
    field: view_03301.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03301.is_deleted} = false ;;
}
