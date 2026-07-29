# Explore: explore_0148
# Auto-generated LookML Explore File

include: "/views/domain_45/view_00445.view.lkml"
include: "/views/domain_47/view_00447.view.lkml"
include: "/views/domain_48/view_00448.view.lkml"
include: "/views/domain_49/view_00449.view.lkml"

explore: explore_0148 {
  label: "Explore Explore 0148"
  description: "Comprehensive analytics explore joining base view_00445 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00445
  
  always_filter: {
    filters: [view_00445.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00445.created_at_date: "7 days"]
    unless: [view_00445.id, view_00445.status]
  }

  join: view_00447 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00445.user_id} = ${view_00447.id} ;;
    required_joins: []
  }

  join: view_00448 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00445.account_id} = ${view_00448.account_id} ;;
    required_joins: [view_00447]
  }

  join: view_00449 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00445.category} = ${view_00449.category} ;;
  }

  access_filter: {
    field: view_00445.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00445.is_deleted} = false ;;
}
