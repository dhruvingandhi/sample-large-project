# Explore: explore_2989
# Auto-generated LookML Explore File

include: "/views/domain_18/view_08968.view.lkml"
include: "/views/domain_20/view_08970.view.lkml"
include: "/views/domain_21/view_08971.view.lkml"
include: "/views/domain_22/view_08972.view.lkml"

explore: explore_2989 {
  label: "Explore Explore 2989"
  description: "Comprehensive analytics explore joining base view_08968 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08968
  
  always_filter: {
    filters: [view_08968.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08968.created_at_date: "7 days"]
    unless: [view_08968.id, view_08968.status]
  }

  join: view_08970 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08968.user_id} = ${view_08970.id} ;;
    required_joins: []
  }

  join: view_08971 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08968.account_id} = ${view_08971.account_id} ;;
    required_joins: [view_08970]
  }

  join: view_08972 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08968.category} = ${view_08972.category} ;;
  }

  access_filter: {
    field: view_08968.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08968.is_deleted} = false ;;
}
