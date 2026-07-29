# Explore: explore_2517
# Auto-generated LookML Explore File

include: "/views/domain_02/view_07552.view.lkml"
include: "/views/domain_04/view_07554.view.lkml"
include: "/views/domain_05/view_07555.view.lkml"
include: "/views/domain_06/view_07556.view.lkml"

explore: explore_2517 {
  label: "Explore Explore 2517"
  description: "Comprehensive analytics explore joining base view_07552 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_07552
  
  always_filter: {
    filters: [view_07552.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07552.created_at_date: "7 days"]
    unless: [view_07552.id, view_07552.status]
  }

  join: view_07554 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07552.user_id} = ${view_07554.id} ;;
    required_joins: []
  }

  join: view_07555 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07552.account_id} = ${view_07555.account_id} ;;
    required_joins: [view_07554]
  }

  join: view_07556 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07552.category} = ${view_07556.category} ;;
  }

  access_filter: {
    field: view_07552.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07552.is_deleted} = false ;;
}
