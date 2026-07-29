# Explore: explore_1045
# Auto-generated LookML Explore File

include: "/views/domain_36/view_03136.view.lkml"
include: "/views/domain_38/view_03138.view.lkml"
include: "/views/domain_39/view_03139.view.lkml"
include: "/views/domain_40/view_03140.view.lkml"

explore: explore_1045 {
  label: "Explore Explore 1045"
  description: "Comprehensive analytics explore joining base view_03136 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_03136
  
  always_filter: {
    filters: [view_03136.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03136.created_at_date: "7 days"]
    unless: [view_03136.id, view_03136.status]
  }

  join: view_03138 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03136.user_id} = ${view_03138.id} ;;
    required_joins: []
  }

  join: view_03139 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03136.account_id} = ${view_03139.account_id} ;;
    required_joins: [view_03138]
  }

  join: view_03140 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03136.category} = ${view_03140.category} ;;
  }

  access_filter: {
    field: view_03136.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03136.is_deleted} = false ;;
}
