# Explore: explore_2934
# Auto-generated LookML Explore File

include: "/views/domain_03/view_08803.view.lkml"
include: "/views/domain_05/view_08805.view.lkml"
include: "/views/domain_06/view_08806.view.lkml"
include: "/views/domain_07/view_08807.view.lkml"

explore: explore_2934 {
  label: "Explore Explore 2934"
  description: "Comprehensive analytics explore joining base view_08803 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08803
  
  always_filter: {
    filters: [view_08803.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08803.created_at_date: "7 days"]
    unless: [view_08803.id, view_08803.status]
  }

  join: view_08805 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08803.user_id} = ${view_08805.id} ;;
    required_joins: []
  }

  join: view_08806 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08803.account_id} = ${view_08806.account_id} ;;
    required_joins: [view_08805]
  }

  join: view_08807 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08803.category} = ${view_08807.category} ;;
  }

  access_filter: {
    field: view_08803.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08803.is_deleted} = false ;;
}
