# Explore: explore_3309
# Auto-generated LookML Explore File

include: "/views/domain_28/view_09928.view.lkml"
include: "/views/domain_30/view_09930.view.lkml"
include: "/views/domain_31/view_09931.view.lkml"
include: "/views/domain_32/view_09932.view.lkml"

explore: explore_3309 {
  label: "Explore Explore 3309"
  description: "Comprehensive analytics explore joining base view_09928 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09928
  
  always_filter: {
    filters: [view_09928.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09928.created_at_date: "7 days"]
    unless: [view_09928.id, view_09928.status]
  }

  join: view_09930 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09928.user_id} = ${view_09930.id} ;;
    required_joins: []
  }

  join: view_09931 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09928.account_id} = ${view_09931.account_id} ;;
    required_joins: [view_09930]
  }

  join: view_09932 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09928.category} = ${view_09932.category} ;;
  }

  access_filter: {
    field: view_09928.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09928.is_deleted} = false ;;
}
