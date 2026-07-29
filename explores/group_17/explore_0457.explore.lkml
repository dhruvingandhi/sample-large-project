# Explore: explore_0457
# Auto-generated LookML Explore File

include: "/views/domain_22/view_01372.view.lkml"
include: "/views/domain_24/view_01374.view.lkml"
include: "/views/domain_25/view_01375.view.lkml"
include: "/views/domain_26/view_01376.view.lkml"

explore: explore_0457 {
  label: "Explore Explore 0457"
  description: "Comprehensive analytics explore joining base view_01372 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_01372
  
  always_filter: {
    filters: [view_01372.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01372.created_at_date: "7 days"]
    unless: [view_01372.id, view_01372.status]
  }

  join: view_01374 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01372.user_id} = ${view_01374.id} ;;
    required_joins: []
  }

  join: view_01375 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01372.account_id} = ${view_01375.account_id} ;;
    required_joins: [view_01374]
  }

  join: view_01376 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01372.category} = ${view_01376.category} ;;
  }

  access_filter: {
    field: view_01372.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01372.is_deleted} = false ;;
}
