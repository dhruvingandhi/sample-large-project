# Explore: explore_2215
# Auto-generated LookML Explore File

include: "/views/domain_46/view_06646.view.lkml"
include: "/views/domain_48/view_06648.view.lkml"
include: "/views/domain_49/view_06649.view.lkml"
include: "/views/domain_50/view_06650.view.lkml"

explore: explore_2215 {
  label: "Explore Explore 2215"
  description: "Comprehensive analytics explore joining base view_06646 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_06646
  
  always_filter: {
    filters: [view_06646.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06646.created_at_date: "7 days"]
    unless: [view_06646.id, view_06646.status]
  }

  join: view_06648 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06646.user_id} = ${view_06648.id} ;;
    required_joins: []
  }

  join: view_06649 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06646.account_id} = ${view_06649.account_id} ;;
    required_joins: [view_06648]
  }

  join: view_06650 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06646.category} = ${view_06650.category} ;;
  }

  access_filter: {
    field: view_06646.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06646.is_deleted} = false ;;
}
