# Explore: explore_1104
# Auto-generated LookML Explore File

include: "/views/domain_13/view_03313.view.lkml"
include: "/views/domain_15/view_03315.view.lkml"
include: "/views/domain_16/view_03316.view.lkml"
include: "/views/domain_17/view_03317.view.lkml"

explore: explore_1104 {
  label: "Explore Explore 1104"
  description: "Comprehensive analytics explore joining base view_03313 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03313
  
  always_filter: {
    filters: [view_03313.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03313.created_at_date: "7 days"]
    unless: [view_03313.id, view_03313.status]
  }

  join: view_03315 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03313.user_id} = ${view_03315.id} ;;
    required_joins: []
  }

  join: view_03316 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03313.account_id} = ${view_03316.account_id} ;;
    required_joins: [view_03315]
  }

  join: view_03317 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03313.category} = ${view_03317.category} ;;
  }

  access_filter: {
    field: view_03313.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03313.is_deleted} = false ;;
}
