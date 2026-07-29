# Explore: explore_3188
# Auto-generated LookML Explore File

include: "/views/domain_15/view_09565.view.lkml"
include: "/views/domain_17/view_09567.view.lkml"
include: "/views/domain_18/view_09568.view.lkml"
include: "/views/domain_19/view_09569.view.lkml"

explore: explore_3188 {
  label: "Explore Explore 3188"
  description: "Comprehensive analytics explore joining base view_09565 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09565
  
  always_filter: {
    filters: [view_09565.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09565.created_at_date: "7 days"]
    unless: [view_09565.id, view_09565.status]
  }

  join: view_09567 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09565.user_id} = ${view_09567.id} ;;
    required_joins: []
  }

  join: view_09568 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09565.account_id} = ${view_09568.account_id} ;;
    required_joins: [view_09567]
  }

  join: view_09569 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09565.category} = ${view_09569.category} ;;
  }

  access_filter: {
    field: view_09565.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09565.is_deleted} = false ;;
}
