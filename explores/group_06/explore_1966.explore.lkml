# Explore: explore_1966
# Auto-generated LookML Explore File

include: "/views/domain_49/view_05899.view.lkml"
include: "/views/domain_01/view_05901.view.lkml"
include: "/views/domain_02/view_05902.view.lkml"
include: "/views/domain_03/view_05903.view.lkml"

explore: explore_1966 {
  label: "Explore Explore 1966"
  description: "Comprehensive analytics explore joining base view_05899 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05899
  
  always_filter: {
    filters: [view_05899.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05899.created_at_date: "7 days"]
    unless: [view_05899.id, view_05899.status]
  }

  join: view_05901 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05899.user_id} = ${view_05901.id} ;;
    required_joins: []
  }

  join: view_05902 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05899.account_id} = ${view_05902.account_id} ;;
    required_joins: [view_05901]
  }

  join: view_05903 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05899.category} = ${view_05903.category} ;;
  }

  access_filter: {
    field: view_05899.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05899.is_deleted} = false ;;
}
