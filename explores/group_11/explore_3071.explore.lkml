# Explore: explore_3071
# Auto-generated LookML Explore File

include: "/views/domain_14/view_09214.view.lkml"
include: "/views/domain_16/view_09216.view.lkml"
include: "/views/domain_17/view_09217.view.lkml"
include: "/views/domain_18/view_09218.view.lkml"

explore: explore_3071 {
  label: "Explore Explore 3071"
  description: "Comprehensive analytics explore joining base view_09214 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09214
  
  always_filter: {
    filters: [view_09214.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09214.created_at_date: "7 days"]
    unless: [view_09214.id, view_09214.status]
  }

  join: view_09216 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09214.user_id} = ${view_09216.id} ;;
    required_joins: []
  }

  join: view_09217 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09214.account_id} = ${view_09217.account_id} ;;
    required_joins: [view_09216]
  }

  join: view_09218 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09214.category} = ${view_09218.category} ;;
  }

  access_filter: {
    field: view_09214.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09214.is_deleted} = false ;;
}
