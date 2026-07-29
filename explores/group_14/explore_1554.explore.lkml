# Explore: explore_1554
# Auto-generated LookML Explore File

include: "/views/domain_13/view_04663.view.lkml"
include: "/views/domain_15/view_04665.view.lkml"
include: "/views/domain_16/view_04666.view.lkml"
include: "/views/domain_17/view_04667.view.lkml"

explore: explore_1554 {
  label: "Explore Explore 1554"
  description: "Comprehensive analytics explore joining base view_04663 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04663
  
  always_filter: {
    filters: [view_04663.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04663.created_at_date: "7 days"]
    unless: [view_04663.id, view_04663.status]
  }

  join: view_04665 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04663.user_id} = ${view_04665.id} ;;
    required_joins: []
  }

  join: view_04666 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04663.account_id} = ${view_04666.account_id} ;;
    required_joins: [view_04665]
  }

  join: view_04667 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04663.category} = ${view_04667.category} ;;
  }

  access_filter: {
    field: view_04663.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04663.is_deleted} = false ;;
}
