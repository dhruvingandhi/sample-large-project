# Explore: explore_1791
# Auto-generated LookML Explore File

include: "/views/domain_24/view_05374.view.lkml"
include: "/views/domain_26/view_05376.view.lkml"
include: "/views/domain_27/view_05377.view.lkml"
include: "/views/domain_28/view_05378.view.lkml"

explore: explore_1791 {
  label: "Explore Explore 1791"
  description: "Comprehensive analytics explore joining base view_05374 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05374
  
  always_filter: {
    filters: [view_05374.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05374.created_at_date: "7 days"]
    unless: [view_05374.id, view_05374.status]
  }

  join: view_05376 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05374.user_id} = ${view_05376.id} ;;
    required_joins: []
  }

  join: view_05377 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05374.account_id} = ${view_05377.account_id} ;;
    required_joins: [view_05376]
  }

  join: view_05378 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05374.category} = ${view_05378.category} ;;
  }

  access_filter: {
    field: view_05374.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05374.is_deleted} = false ;;
}
