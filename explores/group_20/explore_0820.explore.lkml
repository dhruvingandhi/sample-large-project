# Explore: explore_0820
# Auto-generated LookML Explore File

include: "/views/domain_11/view_02461.view.lkml"
include: "/views/domain_13/view_02463.view.lkml"
include: "/views/domain_14/view_02464.view.lkml"
include: "/views/domain_15/view_02465.view.lkml"

explore: explore_0820 {
  label: "Explore Explore 0820"
  description: "Comprehensive analytics explore joining base view_02461 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_02461
  
  always_filter: {
    filters: [view_02461.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02461.created_at_date: "7 days"]
    unless: [view_02461.id, view_02461.status]
  }

  join: view_02463 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02461.user_id} = ${view_02463.id} ;;
    required_joins: []
  }

  join: view_02464 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02461.account_id} = ${view_02464.account_id} ;;
    required_joins: [view_02463]
  }

  join: view_02465 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02461.category} = ${view_02465.category} ;;
  }

  access_filter: {
    field: view_02461.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02461.is_deleted} = false ;;
}
