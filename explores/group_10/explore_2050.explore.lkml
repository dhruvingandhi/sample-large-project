# Explore: explore_2050
# Auto-generated LookML Explore File

include: "/views/domain_01/view_06151.view.lkml"
include: "/views/domain_03/view_06153.view.lkml"
include: "/views/domain_04/view_06154.view.lkml"
include: "/views/domain_05/view_06155.view.lkml"

explore: explore_2050 {
  label: "Explore Explore 2050"
  description: "Comprehensive analytics explore joining base view_06151 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06151
  
  always_filter: {
    filters: [view_06151.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06151.created_at_date: "7 days"]
    unless: [view_06151.id, view_06151.status]
  }

  join: view_06153 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06151.user_id} = ${view_06153.id} ;;
    required_joins: []
  }

  join: view_06154 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06151.account_id} = ${view_06154.account_id} ;;
    required_joins: [view_06153]
  }

  join: view_06155 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06151.category} = ${view_06155.category} ;;
  }

  access_filter: {
    field: view_06151.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06151.is_deleted} = false ;;
}
