# Explore: explore_3542
# Auto-generated LookML Explore File

include: "/views/domain_27/view_10627.view.lkml"
include: "/views/domain_29/view_10629.view.lkml"
include: "/views/domain_30/view_10630.view.lkml"
include: "/views/domain_31/view_10631.view.lkml"

explore: explore_3542 {
  label: "Explore Explore 3542"
  description: "Comprehensive analytics explore joining base view_10627 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10627
  
  always_filter: {
    filters: [view_10627.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10627.created_at_date: "7 days"]
    unless: [view_10627.id, view_10627.status]
  }

  join: view_10629 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10627.user_id} = ${view_10629.id} ;;
    required_joins: []
  }

  join: view_10630 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10627.account_id} = ${view_10630.account_id} ;;
    required_joins: [view_10629]
  }

  join: view_10631 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10627.category} = ${view_10631.category} ;;
  }

  access_filter: {
    field: view_10627.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10627.is_deleted} = false ;;
}
