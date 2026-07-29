# Explore: explore_1909
# Auto-generated LookML Explore File

include: "/views/domain_28/view_05728.view.lkml"
include: "/views/domain_30/view_05730.view.lkml"
include: "/views/domain_31/view_05731.view.lkml"
include: "/views/domain_32/view_05732.view.lkml"

explore: explore_1909 {
  label: "Explore Explore 1909"
  description: "Comprehensive analytics explore joining base view_05728 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_05728
  
  always_filter: {
    filters: [view_05728.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05728.created_at_date: "7 days"]
    unless: [view_05728.id, view_05728.status]
  }

  join: view_05730 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05728.user_id} = ${view_05730.id} ;;
    required_joins: []
  }

  join: view_05731 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05728.account_id} = ${view_05731.account_id} ;;
    required_joins: [view_05730]
  }

  join: view_05732 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05728.category} = ${view_05732.category} ;;
  }

  access_filter: {
    field: view_05728.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05728.is_deleted} = false ;;
}
