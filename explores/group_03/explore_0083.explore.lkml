# Explore: explore_0083
# Auto-generated LookML Explore File

include: "/views/domain_50/view_00250.view.lkml"
include: "/views/domain_02/view_00252.view.lkml"
include: "/views/domain_03/view_00253.view.lkml"
include: "/views/domain_04/view_00254.view.lkml"

explore: explore_0083 {
  label: "Explore Explore 0083"
  description: "Comprehensive analytics explore joining base view_00250 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00250
  
  always_filter: {
    filters: [view_00250.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00250.created_at_date: "7 days"]
    unless: [view_00250.id, view_00250.status]
  }

  join: view_00252 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00250.user_id} = ${view_00252.id} ;;
    required_joins: []
  }

  join: view_00253 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00250.account_id} = ${view_00253.account_id} ;;
    required_joins: [view_00252]
  }

  join: view_00254 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00250.category} = ${view_00254.category} ;;
  }

  access_filter: {
    field: view_00250.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00250.is_deleted} = false ;;
}
