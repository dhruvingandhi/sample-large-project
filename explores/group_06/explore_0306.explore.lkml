# Explore: explore_0306
# Auto-generated LookML Explore File

include: "/views/domain_19/view_00919.view.lkml"
include: "/views/domain_21/view_00921.view.lkml"
include: "/views/domain_22/view_00922.view.lkml"
include: "/views/domain_23/view_00923.view.lkml"

explore: explore_0306 {
  label: "Explore Explore 0306"
  description: "Comprehensive analytics explore joining base view_00919 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00919
  
  always_filter: {
    filters: [view_00919.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00919.created_at_date: "7 days"]
    unless: [view_00919.id, view_00919.status]
  }

  join: view_00921 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00919.user_id} = ${view_00921.id} ;;
    required_joins: []
  }

  join: view_00922 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00919.account_id} = ${view_00922.account_id} ;;
    required_joins: [view_00921]
  }

  join: view_00923 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00919.category} = ${view_00923.category} ;;
  }

  access_filter: {
    field: view_00919.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00919.is_deleted} = false ;;
}
