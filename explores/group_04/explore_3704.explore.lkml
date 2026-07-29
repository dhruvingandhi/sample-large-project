# Explore: explore_3704
# Auto-generated LookML Explore File

include: "/views/domain_13/view_11113.view.lkml"
include: "/views/domain_15/view_11115.view.lkml"
include: "/views/domain_16/view_11116.view.lkml"
include: "/views/domain_17/view_11117.view.lkml"

explore: explore_3704 {
  label: "Explore Explore 3704"
  description: "Comprehensive analytics explore joining base view_11113 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11113
  
  always_filter: {
    filters: [view_11113.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11113.created_at_date: "7 days"]
    unless: [view_11113.id, view_11113.status]
  }

  join: view_11115 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11113.user_id} = ${view_11115.id} ;;
    required_joins: []
  }

  join: view_11116 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11113.account_id} = ${view_11116.account_id} ;;
    required_joins: [view_11115]
  }

  join: view_11117 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11113.category} = ${view_11117.category} ;;
  }

  access_filter: {
    field: view_11113.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11113.is_deleted} = false ;;
}
