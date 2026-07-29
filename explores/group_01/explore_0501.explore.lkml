# Explore: explore_0501
# Auto-generated LookML Explore File

include: "/views/domain_04/view_01504.view.lkml"
include: "/views/domain_06/view_01506.view.lkml"
include: "/views/domain_07/view_01507.view.lkml"
include: "/views/domain_08/view_01508.view.lkml"

explore: explore_0501 {
  label: "Explore Explore 0501"
  description: "Comprehensive analytics explore joining base view_01504 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01504
  
  always_filter: {
    filters: [view_01504.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01504.created_at_date: "7 days"]
    unless: [view_01504.id, view_01504.status]
  }

  join: view_01506 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01504.user_id} = ${view_01506.id} ;;
    required_joins: []
  }

  join: view_01507 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01504.account_id} = ${view_01507.account_id} ;;
    required_joins: [view_01506]
  }

  join: view_01508 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01504.category} = ${view_01508.category} ;;
  }

  access_filter: {
    field: view_01504.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01504.is_deleted} = false ;;
}
