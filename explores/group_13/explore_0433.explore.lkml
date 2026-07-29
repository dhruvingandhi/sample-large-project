# Explore: explore_0433
# Auto-generated LookML Explore File

include: "/views/domain_50/view_01300.view.lkml"
include: "/views/domain_02/view_01302.view.lkml"
include: "/views/domain_03/view_01303.view.lkml"
include: "/views/domain_04/view_01304.view.lkml"

explore: explore_0433 {
  label: "Explore Explore 0433"
  description: "Comprehensive analytics explore joining base view_01300 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_01300
  
  always_filter: {
    filters: [view_01300.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01300.created_at_date: "7 days"]
    unless: [view_01300.id, view_01300.status]
  }

  join: view_01302 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01300.user_id} = ${view_01302.id} ;;
    required_joins: []
  }

  join: view_01303 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01300.account_id} = ${view_01303.account_id} ;;
    required_joins: [view_01302]
  }

  join: view_01304 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01300.category} = ${view_01304.category} ;;
  }

  access_filter: {
    field: view_01300.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01300.is_deleted} = false ;;
}
