# Update for 500 file diff target
# Explore: explore_2725
# Auto-generated LookML Explore File

include: "/views/domain_26/view_08176.view.lkml"
include: "/views/domain_28/view_08178.view.lkml"
include: "/views/domain_29/view_08179.view.lkml"
include: "/views/domain_30/view_08180.view.lkml"

explore: explore_2725 {
  label: "Explore Explore 2725"
  description: "Comprehensive analytics explore joining base view_08176 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08176
  
  always_filter: {
    filters: [view_08176.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08176.created_at_date: "7 days"]
    unless: [view_08176.id, view_08176.status]
  }

  join: view_08178 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08176.user_id} = ${view_08178.id} ;;
    required_joins: []
  }

  join: view_08179 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08176.account_id} = ${view_08179.account_id} ;;
    required_joins: [view_08178]
  }

  join: view_08180 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08176.category} = ${view_08180.category} ;;
  }

  access_filter: {
    field: view_08176.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08176.is_deleted} = false ;;
}
