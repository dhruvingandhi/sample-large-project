# Explore: explore_0008
# Auto-generated LookML Explore File

include: "/views/domain_25/view_00025.view.lkml"
include: "/views/domain_27/view_00027.view.lkml"
include: "/views/domain_28/view_00028.view.lkml"
include: "/views/domain_29/view_00029.view.lkml"

explore: explore_0008 {
  label: "Explore Explore 0008"
  description: "Comprehensive analytics explore joining base view_00025 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_00025
  
  always_filter: {
    filters: [view_00025.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00025.created_at_date: "7 days"]
    unless: [view_00025.id, view_00025.status]
  }

  join: view_00027 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00025.user_id} = ${view_00027.id} ;;
    required_joins: []
  }

  join: view_00028 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00025.account_id} = ${view_00028.account_id} ;;
    required_joins: [view_00027]
  }

  join: view_00029 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00025.category} = ${view_00029.category} ;;
  }

  access_filter: {
    field: view_00025.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00025.is_deleted} = false ;;
}
