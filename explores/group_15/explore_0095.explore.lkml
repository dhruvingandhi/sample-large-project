# Explore: explore_0095
# Auto-generated LookML Explore File

include: "/views/domain_36/view_00286.view.lkml"
include: "/views/domain_38/view_00288.view.lkml"
include: "/views/domain_39/view_00289.view.lkml"
include: "/views/domain_40/view_00290.view.lkml"

explore: explore_0095 {
  label: "Explore Explore 0095"
  description: "Comprehensive analytics explore joining base view_00286 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00286
  
  always_filter: {
    filters: [view_00286.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00286.created_at_date: "7 days"]
    unless: [view_00286.id, view_00286.status]
  }

  join: view_00288 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00286.user_id} = ${view_00288.id} ;;
    required_joins: []
  }

  join: view_00289 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00286.account_id} = ${view_00289.account_id} ;;
    required_joins: [view_00288]
  }

  join: view_00290 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00286.category} = ${view_00290.category} ;;
  }

  access_filter: {
    field: view_00286.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00286.is_deleted} = false ;;
}
