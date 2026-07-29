# Explore: explore_1087
# Auto-generated LookML Explore File

include: "/views/domain_12/view_03262.view.lkml"
include: "/views/domain_14/view_03264.view.lkml"
include: "/views/domain_15/view_03265.view.lkml"
include: "/views/domain_16/view_03266.view.lkml"

explore: explore_1087 {
  label: "Explore Explore 1087"
  description: "Comprehensive analytics explore joining base view_03262 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_03262
  
  always_filter: {
    filters: [view_03262.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03262.created_at_date: "7 days"]
    unless: [view_03262.id, view_03262.status]
  }

  join: view_03264 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03262.user_id} = ${view_03264.id} ;;
    required_joins: []
  }

  join: view_03265 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03262.account_id} = ${view_03265.account_id} ;;
    required_joins: [view_03264]
  }

  join: view_03266 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03262.category} = ${view_03266.category} ;;
  }

  access_filter: {
    field: view_03262.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03262.is_deleted} = false ;;
}
