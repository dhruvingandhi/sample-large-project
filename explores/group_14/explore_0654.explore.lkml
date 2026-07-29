# Explore: explore_0654
# Auto-generated LookML Explore File

include: "/views/domain_13/view_01963.view.lkml"
include: "/views/domain_15/view_01965.view.lkml"
include: "/views/domain_16/view_01966.view.lkml"
include: "/views/domain_17/view_01967.view.lkml"

explore: explore_0654 {
  label: "Explore Explore 0654"
  description: "Comprehensive analytics explore joining base view_01963 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_01963
  
  always_filter: {
    filters: [view_01963.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01963.created_at_date: "7 days"]
    unless: [view_01963.id, view_01963.status]
  }

  join: view_01965 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01963.user_id} = ${view_01965.id} ;;
    required_joins: []
  }

  join: view_01966 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01963.account_id} = ${view_01966.account_id} ;;
    required_joins: [view_01965]
  }

  join: view_01967 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01963.category} = ${view_01967.category} ;;
  }

  access_filter: {
    field: view_01963.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01963.is_deleted} = false ;;
}
