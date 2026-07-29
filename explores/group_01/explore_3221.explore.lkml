# Explore: explore_3221
# Auto-generated LookML Explore File

include: "/views/domain_14/view_09664.view.lkml"
include: "/views/domain_16/view_09666.view.lkml"
include: "/views/domain_17/view_09667.view.lkml"
include: "/views/domain_18/view_09668.view.lkml"

explore: explore_3221 {
  label: "Explore Explore 3221"
  description: "Comprehensive analytics explore joining base view_09664 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09664
  
  always_filter: {
    filters: [view_09664.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09664.created_at_date: "7 days"]
    unless: [view_09664.id, view_09664.status]
  }

  join: view_09666 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09664.user_id} = ${view_09666.id} ;;
    required_joins: []
  }

  join: view_09667 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09664.account_id} = ${view_09667.account_id} ;;
    required_joins: [view_09666]
  }

  join: view_09668 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09664.category} = ${view_09668.category} ;;
  }

  access_filter: {
    field: view_09664.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09664.is_deleted} = false ;;
}
