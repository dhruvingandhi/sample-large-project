# Explore: explore_0075
# Auto-generated LookML Explore File

include: "/views/domain_26/view_00226.view.lkml"
include: "/views/domain_28/view_00228.view.lkml"
include: "/views/domain_29/view_00229.view.lkml"
include: "/views/domain_30/view_00230.view.lkml"

explore: explore_0075 {
  label: "Explore Explore 0075"
  description: "Comprehensive analytics explore joining base view_00226 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00226
  
  always_filter: {
    filters: [view_00226.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00226.created_at_date: "7 days"]
    unless: [view_00226.id, view_00226.status]
  }

  join: view_00228 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00226.user_id} = ${view_00228.id} ;;
    required_joins: []
  }

  join: view_00229 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00226.account_id} = ${view_00229.account_id} ;;
    required_joins: [view_00228]
  }

  join: view_00230 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00226.category} = ${view_00230.category} ;;
  }

  access_filter: {
    field: view_00226.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00226.is_deleted} = false ;;
}
