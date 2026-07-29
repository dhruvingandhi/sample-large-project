# Explore: explore_2851
# Auto-generated LookML Explore File

include: "/views/domain_04/view_08554.view.lkml"
include: "/views/domain_06/view_08556.view.lkml"
include: "/views/domain_07/view_08557.view.lkml"
include: "/views/domain_08/view_08558.view.lkml"

explore: explore_2851 {
  label: "Explore Explore 2851"
  description: "Comprehensive analytics explore joining base view_08554 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08554
  
  always_filter: {
    filters: [view_08554.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08554.created_at_date: "7 days"]
    unless: [view_08554.id, view_08554.status]
  }

  join: view_08556 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08554.user_id} = ${view_08556.id} ;;
    required_joins: []
  }

  join: view_08557 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08554.account_id} = ${view_08557.account_id} ;;
    required_joins: [view_08556]
  }

  join: view_08558 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08554.category} = ${view_08558.category} ;;
  }

  access_filter: {
    field: view_08554.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08554.is_deleted} = false ;;
}
