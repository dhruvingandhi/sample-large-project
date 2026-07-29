# Explore: explore_3008
# Auto-generated LookML Explore File

include: "/views/domain_25/view_09025.view.lkml"
include: "/views/domain_27/view_09027.view.lkml"
include: "/views/domain_28/view_09028.view.lkml"
include: "/views/domain_29/view_09029.view.lkml"

explore: explore_3008 {
  label: "Explore Explore 3008"
  description: "Comprehensive analytics explore joining base view_09025 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09025
  
  always_filter: {
    filters: [view_09025.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09025.created_at_date: "7 days"]
    unless: [view_09025.id, view_09025.status]
  }

  join: view_09027 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09025.user_id} = ${view_09027.id} ;;
    required_joins: []
  }

  join: view_09028 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09025.account_id} = ${view_09028.account_id} ;;
    required_joins: [view_09027]
  }

  join: view_09029 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09025.category} = ${view_09029.category} ;;
  }

  access_filter: {
    field: view_09025.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09025.is_deleted} = false ;;
}
