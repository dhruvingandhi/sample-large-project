# Explore: explore_2817
# Auto-generated LookML Explore File

include: "/views/domain_02/view_08452.view.lkml"
include: "/views/domain_04/view_08454.view.lkml"
include: "/views/domain_05/view_08455.view.lkml"
include: "/views/domain_06/view_08456.view.lkml"

explore: explore_2817 {
  label: "Explore Explore 2817"
  description: "Comprehensive analytics explore joining base view_08452 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08452
  
  always_filter: {
    filters: [view_08452.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08452.created_at_date: "7 days"]
    unless: [view_08452.id, view_08452.status]
  }

  join: view_08454 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08452.user_id} = ${view_08454.id} ;;
    required_joins: []
  }

  join: view_08455 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08452.account_id} = ${view_08455.account_id} ;;
    required_joins: [view_08454]
  }

  join: view_08456 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08452.category} = ${view_08456.category} ;;
  }

  access_filter: {
    field: view_08452.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08452.is_deleted} = false ;;
}
