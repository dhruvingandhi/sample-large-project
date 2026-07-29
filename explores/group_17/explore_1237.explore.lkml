# Explore: explore_1237
# Auto-generated LookML Explore File

include: "/views/domain_12/view_03712.view.lkml"
include: "/views/domain_14/view_03714.view.lkml"
include: "/views/domain_15/view_03715.view.lkml"
include: "/views/domain_16/view_03716.view.lkml"

explore: explore_1237 {
  label: "Explore Explore 1237"
  description: "Comprehensive analytics explore joining base view_03712 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03712
  
  always_filter: {
    filters: [view_03712.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03712.created_at_date: "7 days"]
    unless: [view_03712.id, view_03712.status]
  }

  join: view_03714 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03712.user_id} = ${view_03714.id} ;;
    required_joins: []
  }

  join: view_03715 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03712.account_id} = ${view_03715.account_id} ;;
    required_joins: [view_03714]
  }

  join: view_03716 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03712.category} = ${view_03716.category} ;;
  }

  access_filter: {
    field: view_03712.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03712.is_deleted} = false ;;
}
