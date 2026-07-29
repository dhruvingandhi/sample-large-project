# Explore: explore_0408
# Auto-generated LookML Explore File

include: "/views/domain_25/view_01225.view.lkml"
include: "/views/domain_27/view_01227.view.lkml"
include: "/views/domain_28/view_01228.view.lkml"
include: "/views/domain_29/view_01229.view.lkml"

explore: explore_0408 {
  label: "Explore Explore 0408"
  description: "Comprehensive analytics explore joining base view_01225 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01225
  
  always_filter: {
    filters: [view_01225.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01225.created_at_date: "7 days"]
    unless: [view_01225.id, view_01225.status]
  }

  join: view_01227 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01225.user_id} = ${view_01227.id} ;;
    required_joins: []
  }

  join: view_01228 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01225.account_id} = ${view_01228.account_id} ;;
    required_joins: [view_01227]
  }

  join: view_01229 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01225.category} = ${view_01229.category} ;;
  }

  access_filter: {
    field: view_01225.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01225.is_deleted} = false ;;
}
