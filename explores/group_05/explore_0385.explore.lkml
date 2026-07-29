# Explore: explore_0385
# Auto-generated LookML Explore File

include: "/views/domain_06/view_01156.view.lkml"
include: "/views/domain_08/view_01158.view.lkml"
include: "/views/domain_09/view_01159.view.lkml"
include: "/views/domain_10/view_01160.view.lkml"

explore: explore_0385 {
  label: "Explore Explore 0385"
  description: "Comprehensive analytics explore joining base view_01156 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_01156
  
  always_filter: {
    filters: [view_01156.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01156.created_at_date: "7 days"]
    unless: [view_01156.id, view_01156.status]
  }

  join: view_01158 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01156.user_id} = ${view_01158.id} ;;
    required_joins: []
  }

  join: view_01159 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01156.account_id} = ${view_01159.account_id} ;;
    required_joins: [view_01158]
  }

  join: view_01160 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01156.category} = ${view_01160.category} ;;
  }

  access_filter: {
    field: view_01156.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01156.is_deleted} = false ;;
}
