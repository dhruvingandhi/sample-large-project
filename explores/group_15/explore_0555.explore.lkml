# Explore: explore_0555
# Auto-generated LookML Explore File

include: "/views/domain_16/view_01666.view.lkml"
include: "/views/domain_18/view_01668.view.lkml"
include: "/views/domain_19/view_01669.view.lkml"
include: "/views/domain_20/view_01670.view.lkml"

explore: explore_0555 {
  label: "Explore Explore 0555"
  description: "Comprehensive analytics explore joining base view_01666 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01666
  
  always_filter: {
    filters: [view_01666.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01666.created_at_date: "7 days"]
    unless: [view_01666.id, view_01666.status]
  }

  join: view_01668 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01666.user_id} = ${view_01668.id} ;;
    required_joins: []
  }

  join: view_01669 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01666.account_id} = ${view_01669.account_id} ;;
    required_joins: [view_01668]
  }

  join: view_01670 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01666.category} = ${view_01670.category} ;;
  }

  access_filter: {
    field: view_01666.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01666.is_deleted} = false ;;
}
