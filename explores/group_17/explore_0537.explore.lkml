# Explore: explore_0537
# Auto-generated LookML Explore File

include: "/views/domain_12/view_01612.view.lkml"
include: "/views/domain_14/view_01614.view.lkml"
include: "/views/domain_15/view_01615.view.lkml"
include: "/views/domain_16/view_01616.view.lkml"

explore: explore_0537 {
  label: "Explore Explore 0537"
  description: "Comprehensive analytics explore joining base view_01612 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01612
  
  always_filter: {
    filters: [view_01612.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01612.created_at_date: "7 days"]
    unless: [view_01612.id, view_01612.status]
  }

  join: view_01614 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01612.user_id} = ${view_01614.id} ;;
    required_joins: []
  }

  join: view_01615 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01612.account_id} = ${view_01615.account_id} ;;
    required_joins: [view_01614]
  }

  join: view_01616 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01612.category} = ${view_01616.category} ;;
  }

  access_filter: {
    field: view_01612.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01612.is_deleted} = false ;;
}
