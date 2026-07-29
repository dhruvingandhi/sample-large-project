# Explore: explore_3770
# Auto-generated LookML Explore File

include: "/views/domain_11/view_11311.view.lkml"
include: "/views/domain_13/view_11313.view.lkml"
include: "/views/domain_14/view_11314.view.lkml"
include: "/views/domain_15/view_11315.view.lkml"

explore: explore_3770 {
  label: "Explore Explore 3770"
  description: "Comprehensive analytics explore joining base view_11311 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_11311
  
  always_filter: {
    filters: [view_11311.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11311.created_at_date: "7 days"]
    unless: [view_11311.id, view_11311.status]
  }

  join: view_11313 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11311.user_id} = ${view_11313.id} ;;
    required_joins: []
  }

  join: view_11314 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11311.account_id} = ${view_11314.account_id} ;;
    required_joins: [view_11313]
  }

  join: view_11315 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11311.category} = ${view_11315.category} ;;
  }

  access_filter: {
    field: view_11311.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11311.is_deleted} = false ;;
}
