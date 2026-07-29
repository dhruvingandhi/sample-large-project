# Explore: explore_1066
# Auto-generated LookML Explore File

include: "/views/domain_49/view_03199.view.lkml"
include: "/views/domain_01/view_03201.view.lkml"
include: "/views/domain_02/view_03202.view.lkml"
include: "/views/domain_03/view_03203.view.lkml"

explore: explore_1066 {
  label: "Explore Explore 1066"
  description: "Comprehensive analytics explore joining base view_03199 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03199
  
  always_filter: {
    filters: [view_03199.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03199.created_at_date: "7 days"]
    unless: [view_03199.id, view_03199.status]
  }

  join: view_03201 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03199.user_id} = ${view_03201.id} ;;
    required_joins: []
  }

  join: view_03202 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03199.account_id} = ${view_03202.account_id} ;;
    required_joins: [view_03201]
  }

  join: view_03203 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03199.category} = ${view_03203.category} ;;
  }

  access_filter: {
    field: view_03199.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03199.is_deleted} = false ;;
}
