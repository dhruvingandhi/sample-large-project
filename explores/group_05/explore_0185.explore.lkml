# Explore: explore_0185
# Auto-generated LookML Explore File

include: "/views/domain_06/view_00556.view.lkml"
include: "/views/domain_08/view_00558.view.lkml"
include: "/views/domain_09/view_00559.view.lkml"
include: "/views/domain_10/view_00560.view.lkml"

explore: explore_0185 {
  label: "Explore Explore 0185"
  description: "Comprehensive analytics explore joining base view_00556 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_00556
  
  always_filter: {
    filters: [view_00556.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00556.created_at_date: "7 days"]
    unless: [view_00556.id, view_00556.status]
  }

  join: view_00558 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00556.user_id} = ${view_00558.id} ;;
    required_joins: []
  }

  join: view_00559 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00556.account_id} = ${view_00559.account_id} ;;
    required_joins: [view_00558]
  }

  join: view_00560 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00556.category} = ${view_00560.category} ;;
  }

  access_filter: {
    field: view_00556.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00556.is_deleted} = false ;;
}
