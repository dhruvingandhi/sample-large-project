# Explore: explore_3236
# Auto-generated LookML Explore File

include: "/views/domain_09/view_09709.view.lkml"
include: "/views/domain_11/view_09711.view.lkml"
include: "/views/domain_12/view_09712.view.lkml"
include: "/views/domain_13/view_09713.view.lkml"

explore: explore_3236 {
  label: "Explore Explore 3236"
  description: "Comprehensive analytics explore joining base view_09709 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09709
  
  always_filter: {
    filters: [view_09709.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09709.created_at_date: "7 days"]
    unless: [view_09709.id, view_09709.status]
  }

  join: view_09711 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09709.user_id} = ${view_09711.id} ;;
    required_joins: []
  }

  join: view_09712 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09709.account_id} = ${view_09712.account_id} ;;
    required_joins: [view_09711]
  }

  join: view_09713 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09709.category} = ${view_09713.category} ;;
  }

  access_filter: {
    field: view_09709.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09709.is_deleted} = false ;;
}
