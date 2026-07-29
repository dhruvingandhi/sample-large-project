# Explore: explore_0119
# Auto-generated LookML Explore File

include: "/views/domain_08/view_00358.view.lkml"
include: "/views/domain_10/view_00360.view.lkml"
include: "/views/domain_11/view_00361.view.lkml"
include: "/views/domain_12/view_00362.view.lkml"

explore: explore_0119 {
  label: "Explore Explore 0119"
  description: "Comprehensive analytics explore joining base view_00358 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00358
  
  always_filter: {
    filters: [view_00358.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00358.created_at_date: "7 days"]
    unless: [view_00358.id, view_00358.status]
  }

  join: view_00360 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00358.user_id} = ${view_00360.id} ;;
    required_joins: []
  }

  join: view_00361 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00358.account_id} = ${view_00361.account_id} ;;
    required_joins: [view_00360]
  }

  join: view_00362 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00358.category} = ${view_00362.category} ;;
  }

  access_filter: {
    field: view_00358.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00358.is_deleted} = false ;;
}
