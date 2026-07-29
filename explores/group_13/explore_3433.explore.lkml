# Explore: explore_3433
# Auto-generated LookML Explore File

include: "/views/domain_50/view_10300.view.lkml"
include: "/views/domain_02/view_10302.view.lkml"
include: "/views/domain_03/view_10303.view.lkml"
include: "/views/domain_04/view_10304.view.lkml"

explore: explore_3433 {
  label: "Explore Explore 3433"
  description: "Comprehensive analytics explore joining base view_10300 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_10300
  
  always_filter: {
    filters: [view_10300.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10300.created_at_date: "7 days"]
    unless: [view_10300.id, view_10300.status]
  }

  join: view_10302 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10300.user_id} = ${view_10302.id} ;;
    required_joins: []
  }

  join: view_10303 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10300.account_id} = ${view_10303.account_id} ;;
    required_joins: [view_10302]
  }

  join: view_10304 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10300.category} = ${view_10304.category} ;;
  }

  access_filter: {
    field: view_10300.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10300.is_deleted} = false ;;
}
