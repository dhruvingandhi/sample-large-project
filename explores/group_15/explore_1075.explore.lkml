# Explore: explore_1075
# Auto-generated LookML Explore File

include: "/views/domain_26/view_03226.view.lkml"
include: "/views/domain_28/view_03228.view.lkml"
include: "/views/domain_29/view_03229.view.lkml"
include: "/views/domain_30/view_03230.view.lkml"

explore: explore_1075 {
  label: "Explore Explore 1075"
  description: "Comprehensive analytics explore joining base view_03226 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03226
  
  always_filter: {
    filters: [view_03226.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03226.created_at_date: "7 days"]
    unless: [view_03226.id, view_03226.status]
  }

  join: view_03228 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03226.user_id} = ${view_03228.id} ;;
    required_joins: []
  }

  join: view_03229 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03226.account_id} = ${view_03229.account_id} ;;
    required_joins: [view_03228]
  }

  join: view_03230 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03226.category} = ${view_03230.category} ;;
  }

  access_filter: {
    field: view_03226.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03226.is_deleted} = false ;;
}
