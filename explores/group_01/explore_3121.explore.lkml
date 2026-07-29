# Explore: explore_3121
# Auto-generated LookML Explore File

include: "/views/domain_14/view_09364.view.lkml"
include: "/views/domain_16/view_09366.view.lkml"
include: "/views/domain_17/view_09367.view.lkml"
include: "/views/domain_18/view_09368.view.lkml"

explore: explore_3121 {
  label: "Explore Explore 3121"
  description: "Comprehensive analytics explore joining base view_09364 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09364
  
  always_filter: {
    filters: [view_09364.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09364.created_at_date: "7 days"]
    unless: [view_09364.id, view_09364.status]
  }

  join: view_09366 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09364.user_id} = ${view_09366.id} ;;
    required_joins: []
  }

  join: view_09367 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09364.account_id} = ${view_09367.account_id} ;;
    required_joins: [view_09366]
  }

  join: view_09368 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09364.category} = ${view_09368.category} ;;
  }

  access_filter: {
    field: view_09364.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09364.is_deleted} = false ;;
}
