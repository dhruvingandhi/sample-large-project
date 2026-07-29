# Explore: explore_2793
# Auto-generated LookML Explore File

include: "/views/domain_30/view_08380.view.lkml"
include: "/views/domain_32/view_08382.view.lkml"
include: "/views/domain_33/view_08383.view.lkml"
include: "/views/domain_34/view_08384.view.lkml"

explore: explore_2793 {
  label: "Explore Explore 2793"
  description: "Comprehensive analytics explore joining base view_08380 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08380
  
  always_filter: {
    filters: [view_08380.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08380.created_at_date: "7 days"]
    unless: [view_08380.id, view_08380.status]
  }

  join: view_08382 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08380.user_id} = ${view_08382.id} ;;
    required_joins: []
  }

  join: view_08383 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08380.account_id} = ${view_08383.account_id} ;;
    required_joins: [view_08382]
  }

  join: view_08384 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08380.category} = ${view_08384.category} ;;
  }

  access_filter: {
    field: view_08380.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08380.is_deleted} = false ;;
}
