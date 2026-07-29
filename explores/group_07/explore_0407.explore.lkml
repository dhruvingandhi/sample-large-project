# Explore: explore_0407
# Auto-generated LookML Explore File

include: "/views/domain_22/view_01222.view.lkml"
include: "/views/domain_24/view_01224.view.lkml"
include: "/views/domain_25/view_01225.view.lkml"
include: "/views/domain_26/view_01226.view.lkml"

explore: explore_0407 {
  label: "Explore Explore 0407"
  description: "Comprehensive analytics explore joining base view_01222 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01222
  
  always_filter: {
    filters: [view_01222.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01222.created_at_date: "7 days"]
    unless: [view_01222.id, view_01222.status]
  }

  join: view_01224 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01222.user_id} = ${view_01224.id} ;;
    required_joins: []
  }

  join: view_01225 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01222.account_id} = ${view_01225.account_id} ;;
    required_joins: [view_01224]
  }

  join: view_01226 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01222.category} = ${view_01226.category} ;;
  }

  access_filter: {
    field: view_01222.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01222.is_deleted} = false ;;
}
