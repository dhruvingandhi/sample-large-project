# Explore: explore_3075
# Auto-generated LookML Explore File

include: "/views/domain_26/view_09226.view.lkml"
include: "/views/domain_28/view_09228.view.lkml"
include: "/views/domain_29/view_09229.view.lkml"
include: "/views/domain_30/view_09230.view.lkml"

explore: explore_3075 {
  label: "Explore Explore 3075"
  description: "Comprehensive analytics explore joining base view_09226 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09226
  
  always_filter: {
    filters: [view_09226.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09226.created_at_date: "7 days"]
    unless: [view_09226.id, view_09226.status]
  }

  join: view_09228 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09226.user_id} = ${view_09228.id} ;;
    required_joins: []
  }

  join: view_09229 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09226.account_id} = ${view_09229.account_id} ;;
    required_joins: [view_09228]
  }

  join: view_09230 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09226.category} = ${view_09230.category} ;;
  }

  access_filter: {
    field: view_09226.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09226.is_deleted} = false ;;
}
