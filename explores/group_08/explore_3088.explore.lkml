# Explore: explore_3088
# Auto-generated LookML Explore File

include: "/views/domain_15/view_09265.view.lkml"
include: "/views/domain_17/view_09267.view.lkml"
include: "/views/domain_18/view_09268.view.lkml"
include: "/views/domain_19/view_09269.view.lkml"

explore: explore_3088 {
  label: "Explore Explore 3088"
  description: "Comprehensive analytics explore joining base view_09265 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09265
  
  always_filter: {
    filters: [view_09265.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09265.created_at_date: "7 days"]
    unless: [view_09265.id, view_09265.status]
  }

  join: view_09267 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09265.user_id} = ${view_09267.id} ;;
    required_joins: []
  }

  join: view_09268 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09265.account_id} = ${view_09268.account_id} ;;
    required_joins: [view_09267]
  }

  join: view_09269 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09265.category} = ${view_09269.category} ;;
  }

  access_filter: {
    field: view_09265.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09265.is_deleted} = false ;;
}
