# Explore: explore_3322
# Auto-generated LookML Explore File

include: "/views/domain_17/view_09967.view.lkml"
include: "/views/domain_19/view_09969.view.lkml"
include: "/views/domain_20/view_09970.view.lkml"
include: "/views/domain_21/view_09971.view.lkml"

explore: explore_3322 {
  label: "Explore Explore 3322"
  description: "Comprehensive analytics explore joining base view_09967 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09967
  
  always_filter: {
    filters: [view_09967.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09967.created_at_date: "7 days"]
    unless: [view_09967.id, view_09967.status]
  }

  join: view_09969 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09967.user_id} = ${view_09969.id} ;;
    required_joins: []
  }

  join: view_09970 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09967.account_id} = ${view_09970.account_id} ;;
    required_joins: [view_09969]
  }

  join: view_09971 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09967.category} = ${view_09971.category} ;;
  }

  access_filter: {
    field: view_09967.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09967.is_deleted} = false ;;
}
