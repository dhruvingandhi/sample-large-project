# Explore: explore_1455
# Auto-generated LookML Explore File

include: "/views/domain_16/view_04366.view.lkml"
include: "/views/domain_18/view_04368.view.lkml"
include: "/views/domain_19/view_04369.view.lkml"
include: "/views/domain_20/view_04370.view.lkml"

explore: explore_1455 {
  label: "Explore Explore 1455"
  description: "Comprehensive analytics explore joining base view_04366 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04366
  
  always_filter: {
    filters: [view_04366.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04366.created_at_date: "7 days"]
    unless: [view_04366.id, view_04366.status]
  }

  join: view_04368 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04366.user_id} = ${view_04368.id} ;;
    required_joins: []
  }

  join: view_04369 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04366.account_id} = ${view_04369.account_id} ;;
    required_joins: [view_04368]
  }

  join: view_04370 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04366.category} = ${view_04370.category} ;;
  }

  access_filter: {
    field: view_04366.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04366.is_deleted} = false ;;
}
