# Explore: explore_2016
# Auto-generated LookML Explore File

include: "/views/domain_49/view_06049.view.lkml"
include: "/views/domain_01/view_06051.view.lkml"
include: "/views/domain_02/view_06052.view.lkml"
include: "/views/domain_03/view_06053.view.lkml"

explore: explore_2016 {
  label: "Explore Explore 2016"
  description: "Comprehensive analytics explore joining base view_06049 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06049
  
  always_filter: {
    filters: [view_06049.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06049.created_at_date: "7 days"]
    unless: [view_06049.id, view_06049.status]
  }

  join: view_06051 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06049.user_id} = ${view_06051.id} ;;
    required_joins: []
  }

  join: view_06052 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06049.account_id} = ${view_06052.account_id} ;;
    required_joins: [view_06051]
  }

  join: view_06053 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06049.category} = ${view_06053.category} ;;
  }

  access_filter: {
    field: view_06049.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06049.is_deleted} = false ;;
}
