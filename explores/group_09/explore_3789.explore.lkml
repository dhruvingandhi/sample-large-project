# Explore: explore_3789
# Auto-generated LookML Explore File

include: "/views/domain_18/view_11368.view.lkml"
include: "/views/domain_20/view_11370.view.lkml"
include: "/views/domain_21/view_11371.view.lkml"
include: "/views/domain_22/view_11372.view.lkml"

explore: explore_3789 {
  label: "Explore Explore 3789"
  description: "Comprehensive analytics explore joining base view_11368 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11368
  
  always_filter: {
    filters: [view_11368.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11368.created_at_date: "7 days"]
    unless: [view_11368.id, view_11368.status]
  }

  join: view_11370 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11368.user_id} = ${view_11370.id} ;;
    required_joins: []
  }

  join: view_11371 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11368.account_id} = ${view_11371.account_id} ;;
    required_joins: [view_11370]
  }

  join: view_11372 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11368.category} = ${view_11372.category} ;;
  }

  access_filter: {
    field: view_11368.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11368.is_deleted} = false ;;
}
