# Explore: explore_1542
# Auto-generated LookML Explore File

include: "/views/domain_27/view_04627.view.lkml"
include: "/views/domain_29/view_04629.view.lkml"
include: "/views/domain_30/view_04630.view.lkml"
include: "/views/domain_31/view_04631.view.lkml"

explore: explore_1542 {
  label: "Explore Explore 1542"
  description: "Comprehensive analytics explore joining base view_04627 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04627
  
  always_filter: {
    filters: [view_04627.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04627.created_at_date: "7 days"]
    unless: [view_04627.id, view_04627.status]
  }

  join: view_04629 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04627.user_id} = ${view_04629.id} ;;
    required_joins: []
  }

  join: view_04630 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04627.account_id} = ${view_04630.account_id} ;;
    required_joins: [view_04629]
  }

  join: view_04631 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04627.category} = ${view_04631.category} ;;
  }

  access_filter: {
    field: view_04627.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04627.is_deleted} = false ;;
}
