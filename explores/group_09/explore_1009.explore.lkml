# Explore: explore_1009
# Auto-generated LookML Explore File

include: "/views/domain_28/view_03028.view.lkml"
include: "/views/domain_30/view_03030.view.lkml"
include: "/views/domain_31/view_03031.view.lkml"
include: "/views/domain_32/view_03032.view.lkml"

explore: explore_1009 {
  label: "Explore Explore 1009"
  description: "Comprehensive analytics explore joining base view_03028 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_03028
  
  always_filter: {
    filters: [view_03028.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03028.created_at_date: "7 days"]
    unless: [view_03028.id, view_03028.status]
  }

  join: view_03030 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03028.user_id} = ${view_03030.id} ;;
    required_joins: []
  }

  join: view_03031 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03028.account_id} = ${view_03031.account_id} ;;
    required_joins: [view_03030]
  }

  join: view_03032 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03028.category} = ${view_03032.category} ;;
  }

  access_filter: {
    field: view_03028.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03028.is_deleted} = false ;;
}
