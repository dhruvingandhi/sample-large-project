# Explore: explore_1725
# Auto-generated LookML Explore File

include: "/views/domain_26/view_05176.view.lkml"
include: "/views/domain_28/view_05178.view.lkml"
include: "/views/domain_29/view_05179.view.lkml"
include: "/views/domain_30/view_05180.view.lkml"

explore: explore_1725 {
  label: "Explore Explore 1725"
  description: "Comprehensive analytics explore joining base view_05176 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_05176
  
  always_filter: {
    filters: [view_05176.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05176.created_at_date: "7 days"]
    unless: [view_05176.id, view_05176.status]
  }

  join: view_05178 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05176.user_id} = ${view_05178.id} ;;
    required_joins: []
  }

  join: view_05179 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05176.account_id} = ${view_05179.account_id} ;;
    required_joins: [view_05178]
  }

  join: view_05180 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05176.category} = ${view_05180.category} ;;
  }

  access_filter: {
    field: view_05176.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05176.is_deleted} = false ;;
}
