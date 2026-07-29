# Explore: explore_2933
# Auto-generated LookML Explore File

include: "/views/domain_50/view_08800.view.lkml"
include: "/views/domain_02/view_08802.view.lkml"
include: "/views/domain_03/view_08803.view.lkml"
include: "/views/domain_04/view_08804.view.lkml"

explore: explore_2933 {
  label: "Explore Explore 2933"
  description: "Comprehensive analytics explore joining base view_08800 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08800
  
  always_filter: {
    filters: [view_08800.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08800.created_at_date: "7 days"]
    unless: [view_08800.id, view_08800.status]
  }

  join: view_08802 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08800.user_id} = ${view_08802.id} ;;
    required_joins: []
  }

  join: view_08803 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08800.account_id} = ${view_08803.account_id} ;;
    required_joins: [view_08802]
  }

  join: view_08804 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08800.category} = ${view_08804.category} ;;
  }

  access_filter: {
    field: view_08800.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08800.is_deleted} = false ;;
}
