# Explore: explore_2095
# Auto-generated LookML Explore File

include: "/views/domain_36/view_06286.view.lkml"
include: "/views/domain_38/view_06288.view.lkml"
include: "/views/domain_39/view_06289.view.lkml"
include: "/views/domain_40/view_06290.view.lkml"

explore: explore_2095 {
  label: "Explore Explore 2095"
  description: "Comprehensive analytics explore joining base view_06286 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06286
  
  always_filter: {
    filters: [view_06286.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06286.created_at_date: "7 days"]
    unless: [view_06286.id, view_06286.status]
  }

  join: view_06288 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06286.user_id} = ${view_06288.id} ;;
    required_joins: []
  }

  join: view_06289 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06286.account_id} = ${view_06289.account_id} ;;
    required_joins: [view_06288]
  }

  join: view_06290 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06286.category} = ${view_06290.category} ;;
  }

  access_filter: {
    field: view_06286.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06286.is_deleted} = false ;;
}
