# Explore: explore_1863
# Auto-generated LookML Explore File

include: "/views/domain_40/view_05590.view.lkml"
include: "/views/domain_42/view_05592.view.lkml"
include: "/views/domain_43/view_05593.view.lkml"
include: "/views/domain_44/view_05594.view.lkml"

explore: explore_1863 {
  label: "Explore Explore 1863"
  description: "Comprehensive analytics explore joining base view_05590 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05590
  
  always_filter: {
    filters: [view_05590.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05590.created_at_date: "7 days"]
    unless: [view_05590.id, view_05590.status]
  }

  join: view_05592 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05590.user_id} = ${view_05592.id} ;;
    required_joins: []
  }

  join: view_05593 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05590.account_id} = ${view_05593.account_id} ;;
    required_joins: [view_05592]
  }

  join: view_05594 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05590.category} = ${view_05594.category} ;;
  }

  access_filter: {
    field: view_05590.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05590.is_deleted} = false ;;
}
