# Explore: explore_0088
# Auto-generated LookML Explore File

include: "/views/domain_15/view_00265.view.lkml"
include: "/views/domain_17/view_00267.view.lkml"
include: "/views/domain_18/view_00268.view.lkml"
include: "/views/domain_19/view_00269.view.lkml"

explore: explore_0088 {
  label: "Explore Explore 0088"
  description: "Comprehensive analytics explore joining base view_00265 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00265
  
  always_filter: {
    filters: [view_00265.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00265.created_at_date: "7 days"]
    unless: [view_00265.id, view_00265.status]
  }

  join: view_00267 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00265.user_id} = ${view_00267.id} ;;
    required_joins: []
  }

  join: view_00268 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00265.account_id} = ${view_00268.account_id} ;;
    required_joins: [view_00267]
  }

  join: view_00269 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00265.category} = ${view_00269.category} ;;
  }

  access_filter: {
    field: view_00265.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00265.is_deleted} = false ;;
}
