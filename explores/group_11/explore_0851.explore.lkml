# Explore: explore_0851
# Auto-generated LookML Explore File

include: "/views/domain_04/view_02554.view.lkml"
include: "/views/domain_06/view_02556.view.lkml"
include: "/views/domain_07/view_02557.view.lkml"
include: "/views/domain_08/view_02558.view.lkml"

explore: explore_0851 {
  label: "Explore Explore 0851"
  description: "Comprehensive analytics explore joining base view_02554 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02554
  
  always_filter: {
    filters: [view_02554.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02554.created_at_date: "7 days"]
    unless: [view_02554.id, view_02554.status]
  }

  join: view_02556 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02554.user_id} = ${view_02556.id} ;;
    required_joins: []
  }

  join: view_02557 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02554.account_id} = ${view_02557.account_id} ;;
    required_joins: [view_02556]
  }

  join: view_02558 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02554.category} = ${view_02558.category} ;;
  }

  access_filter: {
    field: view_02554.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02554.is_deleted} = false ;;
}
