# Explore: explore_1106
# Auto-generated LookML Explore File

include: "/views/domain_19/view_03319.view.lkml"
include: "/views/domain_21/view_03321.view.lkml"
include: "/views/domain_22/view_03322.view.lkml"
include: "/views/domain_23/view_03323.view.lkml"

explore: explore_1106 {
  label: "Explore Explore 1106"
  description: "Comprehensive analytics explore joining base view_03319 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03319
  
  always_filter: {
    filters: [view_03319.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03319.created_at_date: "7 days"]
    unless: [view_03319.id, view_03319.status]
  }

  join: view_03321 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03319.user_id} = ${view_03321.id} ;;
    required_joins: []
  }

  join: view_03322 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03319.account_id} = ${view_03322.account_id} ;;
    required_joins: [view_03321]
  }

  join: view_03323 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03319.category} = ${view_03323.category} ;;
  }

  access_filter: {
    field: view_03319.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03319.is_deleted} = false ;;
}
