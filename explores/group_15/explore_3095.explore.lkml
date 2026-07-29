# Explore: explore_3095
# Auto-generated LookML Explore File

include: "/views/domain_36/view_09286.view.lkml"
include: "/views/domain_38/view_09288.view.lkml"
include: "/views/domain_39/view_09289.view.lkml"
include: "/views/domain_40/view_09290.view.lkml"

explore: explore_3095 {
  label: "Explore Explore 3095"
  description: "Comprehensive analytics explore joining base view_09286 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09286
  
  always_filter: {
    filters: [view_09286.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09286.created_at_date: "7 days"]
    unless: [view_09286.id, view_09286.status]
  }

  join: view_09288 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09286.user_id} = ${view_09288.id} ;;
    required_joins: []
  }

  join: view_09289 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09286.account_id} = ${view_09289.account_id} ;;
    required_joins: [view_09288]
  }

  join: view_09290 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09286.category} = ${view_09290.category} ;;
  }

  access_filter: {
    field: view_09286.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09286.is_deleted} = false ;;
}
