# Explore: explore_2701
# Auto-generated LookML Explore File

include: "/views/domain_04/view_08104.view.lkml"
include: "/views/domain_06/view_08106.view.lkml"
include: "/views/domain_07/view_08107.view.lkml"
include: "/views/domain_08/view_08108.view.lkml"

explore: explore_2701 {
  label: "Explore Explore 2701"
  description: "Comprehensive analytics explore joining base view_08104 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_08104
  
  always_filter: {
    filters: [view_08104.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08104.created_at_date: "7 days"]
    unless: [view_08104.id, view_08104.status]
  }

  join: view_08106 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08104.user_id} = ${view_08106.id} ;;
    required_joins: []
  }

  join: view_08107 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08104.account_id} = ${view_08107.account_id} ;;
    required_joins: [view_08106]
  }

  join: view_08108 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08104.category} = ${view_08108.category} ;;
  }

  access_filter: {
    field: view_08104.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08104.is_deleted} = false ;;
}
