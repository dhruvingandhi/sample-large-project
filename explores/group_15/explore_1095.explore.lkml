# Explore: explore_1095
# Auto-generated LookML Explore File

include: "/views/domain_36/view_03286.view.lkml"
include: "/views/domain_38/view_03288.view.lkml"
include: "/views/domain_39/view_03289.view.lkml"
include: "/views/domain_40/view_03290.view.lkml"

explore: explore_1095 {
  label: "Explore Explore 1095"
  description: "Comprehensive analytics explore joining base view_03286 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03286
  
  always_filter: {
    filters: [view_03286.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03286.created_at_date: "7 days"]
    unless: [view_03286.id, view_03286.status]
  }

  join: view_03288 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03286.user_id} = ${view_03288.id} ;;
    required_joins: []
  }

  join: view_03289 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03286.account_id} = ${view_03289.account_id} ;;
    required_joins: [view_03288]
  }

  join: view_03290 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03286.category} = ${view_03290.category} ;;
  }

  access_filter: {
    field: view_03286.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03286.is_deleted} = false ;;
}
