# Explore: explore_3554
# Auto-generated LookML Explore File

include: "/views/domain_13/view_10663.view.lkml"
include: "/views/domain_15/view_10665.view.lkml"
include: "/views/domain_16/view_10666.view.lkml"
include: "/views/domain_17/view_10667.view.lkml"

explore: explore_3554 {
  label: "Explore Explore 3554"
  description: "Comprehensive analytics explore joining base view_10663 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10663
  
  always_filter: {
    filters: [view_10663.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10663.created_at_date: "7 days"]
    unless: [view_10663.id, view_10663.status]
  }

  join: view_10665 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10663.user_id} = ${view_10665.id} ;;
    required_joins: []
  }

  join: view_10666 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10663.account_id} = ${view_10666.account_id} ;;
    required_joins: [view_10665]
  }

  join: view_10667 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10663.category} = ${view_10667.category} ;;
  }

  access_filter: {
    field: view_10663.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10663.is_deleted} = false ;;
}
