# Explore: explore_3206
# Auto-generated LookML Explore File

include: "/views/domain_19/view_09619.view.lkml"
include: "/views/domain_21/view_09621.view.lkml"
include: "/views/domain_22/view_09622.view.lkml"
include: "/views/domain_23/view_09623.view.lkml"

explore: explore_3206 {
  label: "Explore Explore 3206"
  description: "Comprehensive analytics explore joining base view_09619 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09619
  
  always_filter: {
    filters: [view_09619.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09619.created_at_date: "7 days"]
    unless: [view_09619.id, view_09619.status]
  }

  join: view_09621 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09619.user_id} = ${view_09621.id} ;;
    required_joins: []
  }

  join: view_09622 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09619.account_id} = ${view_09622.account_id} ;;
    required_joins: [view_09621]
  }

  join: view_09623 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09619.category} = ${view_09623.category} ;;
  }

  access_filter: {
    field: view_09619.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09619.is_deleted} = false ;;
}
