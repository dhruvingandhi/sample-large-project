# Explore: explore_0101
# Auto-generated LookML Explore File

include: "/views/domain_04/view_00304.view.lkml"
include: "/views/domain_06/view_00306.view.lkml"
include: "/views/domain_07/view_00307.view.lkml"
include: "/views/domain_08/view_00308.view.lkml"

explore: explore_0101 {
  label: "Explore Explore 0101"
  description: "Comprehensive analytics explore joining base view_00304 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_00304
  
  always_filter: {
    filters: [view_00304.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00304.created_at_date: "7 days"]
    unless: [view_00304.id, view_00304.status]
  }

  join: view_00306 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00304.user_id} = ${view_00306.id} ;;
    required_joins: []
  }

  join: view_00307 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00304.account_id} = ${view_00307.account_id} ;;
    required_joins: [view_00306]
  }

  join: view_00308 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00304.category} = ${view_00308.category} ;;
  }

  access_filter: {
    field: view_00304.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00304.is_deleted} = false ;;
}
