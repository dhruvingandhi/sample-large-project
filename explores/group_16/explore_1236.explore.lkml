# Explore: explore_1236
# Auto-generated LookML Explore File

include: "/views/domain_09/view_03709.view.lkml"
include: "/views/domain_11/view_03711.view.lkml"
include: "/views/domain_12/view_03712.view.lkml"
include: "/views/domain_13/view_03713.view.lkml"

explore: explore_1236 {
  label: "Explore Explore 1236"
  description: "Comprehensive analytics explore joining base view_03709 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03709
  
  always_filter: {
    filters: [view_03709.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03709.created_at_date: "7 days"]
    unless: [view_03709.id, view_03709.status]
  }

  join: view_03711 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03709.user_id} = ${view_03711.id} ;;
    required_joins: []
  }

  join: view_03712 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03709.account_id} = ${view_03712.account_id} ;;
    required_joins: [view_03711]
  }

  join: view_03713 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03709.category} = ${view_03713.category} ;;
  }

  access_filter: {
    field: view_03709.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03709.is_deleted} = false ;;
}
