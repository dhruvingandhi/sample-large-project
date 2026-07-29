# Explore: explore_0168
# Auto-generated LookML Explore File

include: "/views/domain_05/view_00505.view.lkml"
include: "/views/domain_07/view_00507.view.lkml"
include: "/views/domain_08/view_00508.view.lkml"
include: "/views/domain_09/view_00509.view.lkml"

explore: explore_0168 {
  label: "Explore Explore 0168"
  description: "Comprehensive analytics explore joining base view_00505 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00505
  
  always_filter: {
    filters: [view_00505.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00505.created_at_date: "7 days"]
    unless: [view_00505.id, view_00505.status]
  }

  join: view_00507 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00505.user_id} = ${view_00507.id} ;;
    required_joins: []
  }

  join: view_00508 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00505.account_id} = ${view_00508.account_id} ;;
    required_joins: [view_00507]
  }

  join: view_00509 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00505.category} = ${view_00509.category} ;;
  }

  access_filter: {
    field: view_00505.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00505.is_deleted} = false ;;
}
