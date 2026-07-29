# Explore: explore_3288
# Auto-generated LookML Explore File

include: "/views/domain_15/view_09865.view.lkml"
include: "/views/domain_17/view_09867.view.lkml"
include: "/views/domain_18/view_09868.view.lkml"
include: "/views/domain_19/view_09869.view.lkml"

explore: explore_3288 {
  label: "Explore Explore 3288"
  description: "Comprehensive analytics explore joining base view_09865 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09865
  
  always_filter: {
    filters: [view_09865.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09865.created_at_date: "7 days"]
    unless: [view_09865.id, view_09865.status]
  }

  join: view_09867 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09865.user_id} = ${view_09867.id} ;;
    required_joins: []
  }

  join: view_09868 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09865.account_id} = ${view_09868.account_id} ;;
    required_joins: [view_09867]
  }

  join: view_09869 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09865.category} = ${view_09869.category} ;;
  }

  access_filter: {
    field: view_09865.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09865.is_deleted} = false ;;
}
