# Explore: explore_2035
# Auto-generated LookML Explore File

include: "/views/domain_06/view_06106.view.lkml"
include: "/views/domain_08/view_06108.view.lkml"
include: "/views/domain_09/view_06109.view.lkml"
include: "/views/domain_10/view_06110.view.lkml"

explore: explore_2035 {
  label: "Explore Explore 2035"
  description: "Comprehensive analytics explore joining base view_06106 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06106
  
  always_filter: {
    filters: [view_06106.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06106.created_at_date: "7 days"]
    unless: [view_06106.id, view_06106.status]
  }

  join: view_06108 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06106.user_id} = ${view_06108.id} ;;
    required_joins: []
  }

  join: view_06109 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06106.account_id} = ${view_06109.account_id} ;;
    required_joins: [view_06108]
  }

  join: view_06110 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06106.category} = ${view_06110.category} ;;
  }

  access_filter: {
    field: view_06106.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06106.is_deleted} = false ;;
}
