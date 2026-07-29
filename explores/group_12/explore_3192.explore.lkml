# Explore: explore_3192
# Auto-generated LookML Explore File

include: "/views/domain_27/view_09577.view.lkml"
include: "/views/domain_29/view_09579.view.lkml"
include: "/views/domain_30/view_09580.view.lkml"
include: "/views/domain_31/view_09581.view.lkml"

explore: explore_3192 {
  label: "Explore Explore 3192"
  description: "Comprehensive analytics explore joining base view_09577 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_09577
  
  always_filter: {
    filters: [view_09577.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09577.created_at_date: "7 days"]
    unless: [view_09577.id, view_09577.status]
  }

  join: view_09579 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09577.user_id} = ${view_09579.id} ;;
    required_joins: []
  }

  join: view_09580 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09577.account_id} = ${view_09580.account_id} ;;
    required_joins: [view_09579]
  }

  join: view_09581 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09577.category} = ${view_09581.category} ;;
  }

  access_filter: {
    field: view_09577.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09577.is_deleted} = false ;;
}
