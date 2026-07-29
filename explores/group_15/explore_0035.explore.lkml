# Explore: explore_0035
# Auto-generated LookML Explore File

include: "/views/domain_06/view_00106.view.lkml"
include: "/views/domain_08/view_00108.view.lkml"
include: "/views/domain_09/view_00109.view.lkml"
include: "/views/domain_10/view_00110.view.lkml"

explore: explore_0035 {
  label: "Explore Explore 0035"
  description: "Comprehensive analytics explore joining base view_00106 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_00106
  
  always_filter: {
    filters: [view_00106.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00106.created_at_date: "7 days"]
    unless: [view_00106.id, view_00106.status]
  }

  join: view_00108 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00106.user_id} = ${view_00108.id} ;;
    required_joins: []
  }

  join: view_00109 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00106.account_id} = ${view_00109.account_id} ;;
    required_joins: [view_00108]
  }

  join: view_00110 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00106.category} = ${view_00110.category} ;;
  }

  access_filter: {
    field: view_00106.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00106.is_deleted} = false ;;
}
