# Explore: explore_0576
# Auto-generated LookML Explore File

include: "/views/domain_29/view_01729.view.lkml"
include: "/views/domain_31/view_01731.view.lkml"
include: "/views/domain_32/view_01732.view.lkml"
include: "/views/domain_33/view_01733.view.lkml"

explore: explore_0576 {
  label: "Explore Explore 0576"
  description: "Comprehensive analytics explore joining base view_01729 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01729
  
  always_filter: {
    filters: [view_01729.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01729.created_at_date: "7 days"]
    unless: [view_01729.id, view_01729.status]
  }

  join: view_01731 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01729.user_id} = ${view_01731.id} ;;
    required_joins: []
  }

  join: view_01732 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01729.account_id} = ${view_01732.account_id} ;;
    required_joins: [view_01731]
  }

  join: view_01733 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01729.category} = ${view_01733.category} ;;
  }

  access_filter: {
    field: view_01729.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01729.is_deleted} = false ;;
}
