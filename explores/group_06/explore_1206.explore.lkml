# Explore: explore_1206
# Auto-generated LookML Explore File

include: "/views/domain_19/view_03619.view.lkml"
include: "/views/domain_21/view_03621.view.lkml"
include: "/views/domain_22/view_03622.view.lkml"
include: "/views/domain_23/view_03623.view.lkml"

explore: explore_1206 {
  label: "Explore Explore 1206"
  description: "Comprehensive analytics explore joining base view_03619 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03619
  
  always_filter: {
    filters: [view_03619.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03619.created_at_date: "7 days"]
    unless: [view_03619.id, view_03619.status]
  }

  join: view_03621 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03619.user_id} = ${view_03621.id} ;;
    required_joins: []
  }

  join: view_03622 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03619.account_id} = ${view_03622.account_id} ;;
    required_joins: [view_03621]
  }

  join: view_03623 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03619.category} = ${view_03623.category} ;;
  }

  access_filter: {
    field: view_03619.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03619.is_deleted} = false ;;
}
