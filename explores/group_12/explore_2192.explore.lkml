# Explore: explore_2192
# Auto-generated LookML Explore File

include: "/views/domain_27/view_06577.view.lkml"
include: "/views/domain_29/view_06579.view.lkml"
include: "/views/domain_30/view_06580.view.lkml"
include: "/views/domain_31/view_06581.view.lkml"

explore: explore_2192 {
  label: "Explore Explore 2192"
  description: "Comprehensive analytics explore joining base view_06577 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_06577
  
  always_filter: {
    filters: [view_06577.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06577.created_at_date: "7 days"]
    unless: [view_06577.id, view_06577.status]
  }

  join: view_06579 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06577.user_id} = ${view_06579.id} ;;
    required_joins: []
  }

  join: view_06580 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06577.account_id} = ${view_06580.account_id} ;;
    required_joins: [view_06579]
  }

  join: view_06581 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06577.category} = ${view_06581.category} ;;
  }

  access_filter: {
    field: view_06577.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06577.is_deleted} = false ;;
}
