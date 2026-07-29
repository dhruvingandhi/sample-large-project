# Explore: explore_2733
# Auto-generated LookML Explore File

include: "/views/domain_50/view_08200.view.lkml"
include: "/views/domain_02/view_08202.view.lkml"
include: "/views/domain_03/view_08203.view.lkml"
include: "/views/domain_04/view_08204.view.lkml"

explore: explore_2733 {
  label: "Explore Explore 2733"
  description: "Comprehensive analytics explore joining base view_08200 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08200
  
  always_filter: {
    filters: [view_08200.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08200.created_at_date: "7 days"]
    unless: [view_08200.id, view_08200.status]
  }

  join: view_08202 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08200.user_id} = ${view_08202.id} ;;
    required_joins: []
  }

  join: view_08203 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08200.account_id} = ${view_08203.account_id} ;;
    required_joins: [view_08202]
  }

  join: view_08204 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08200.category} = ${view_08204.category} ;;
  }

  access_filter: {
    field: view_08200.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08200.is_deleted} = false ;;
}
