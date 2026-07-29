# Explore: explore_2700
# Auto-generated LookML Explore File

include: "/views/domain_01/view_08101.view.lkml"
include: "/views/domain_03/view_08103.view.lkml"
include: "/views/domain_04/view_08104.view.lkml"
include: "/views/domain_05/view_08105.view.lkml"

explore: explore_2700 {
  label: "Explore Explore 2700"
  description: "Comprehensive analytics explore joining base view_08101 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_08101
  
  always_filter: {
    filters: [view_08101.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08101.created_at_date: "7 days"]
    unless: [view_08101.id, view_08101.status]
  }

  join: view_08103 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08101.user_id} = ${view_08103.id} ;;
    required_joins: []
  }

  join: view_08104 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08101.account_id} = ${view_08104.account_id} ;;
    required_joins: [view_08103]
  }

  join: view_08105 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08101.category} = ${view_08105.category} ;;
  }

  access_filter: {
    field: view_08101.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08101.is_deleted} = false ;;
}
