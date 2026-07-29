# Explore: explore_2075
# Auto-generated LookML Explore File

include: "/views/domain_26/view_06226.view.lkml"
include: "/views/domain_28/view_06228.view.lkml"
include: "/views/domain_29/view_06229.view.lkml"
include: "/views/domain_30/view_06230.view.lkml"

explore: explore_2075 {
  label: "Explore Explore 2075"
  description: "Comprehensive analytics explore joining base view_06226 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06226
  
  always_filter: {
    filters: [view_06226.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06226.created_at_date: "7 days"]
    unless: [view_06226.id, view_06226.status]
  }

  join: view_06228 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06226.user_id} = ${view_06228.id} ;;
    required_joins: []
  }

  join: view_06229 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06226.account_id} = ${view_06229.account_id} ;;
    required_joins: [view_06228]
  }

  join: view_06230 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06226.category} = ${view_06230.category} ;;
  }

  access_filter: {
    field: view_06226.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06226.is_deleted} = false ;;
}
