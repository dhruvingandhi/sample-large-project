# Explore: explore_1806
# Auto-generated LookML Explore File

include: "/views/domain_19/view_05419.view.lkml"
include: "/views/domain_21/view_05421.view.lkml"
include: "/views/domain_22/view_05422.view.lkml"
include: "/views/domain_23/view_05423.view.lkml"

explore: explore_1806 {
  label: "Explore Explore 1806"
  description: "Comprehensive analytics explore joining base view_05419 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_05419
  
  always_filter: {
    filters: [view_05419.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05419.created_at_date: "7 days"]
    unless: [view_05419.id, view_05419.status]
  }

  join: view_05421 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05419.user_id} = ${view_05421.id} ;;
    required_joins: []
  }

  join: view_05422 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05419.account_id} = ${view_05422.account_id} ;;
    required_joins: [view_05421]
  }

  join: view_05423 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05419.category} = ${view_05423.category} ;;
  }

  access_filter: {
    field: view_05419.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05419.is_deleted} = false ;;
}
