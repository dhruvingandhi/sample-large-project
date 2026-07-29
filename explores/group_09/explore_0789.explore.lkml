# Explore: explore_0789
# Auto-generated LookML Explore File

include: "/views/domain_18/view_02368.view.lkml"
include: "/views/domain_20/view_02370.view.lkml"
include: "/views/domain_21/view_02371.view.lkml"
include: "/views/domain_22/view_02372.view.lkml"

explore: explore_0789 {
  label: "Explore Explore 0789"
  description: "Comprehensive analytics explore joining base view_02368 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02368
  
  always_filter: {
    filters: [view_02368.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02368.created_at_date: "7 days"]
    unless: [view_02368.id, view_02368.status]
  }

  join: view_02370 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02368.user_id} = ${view_02370.id} ;;
    required_joins: []
  }

  join: view_02371 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02368.account_id} = ${view_02371.account_id} ;;
    required_joins: [view_02370]
  }

  join: view_02372 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02368.category} = ${view_02372.category} ;;
  }

  access_filter: {
    field: view_02368.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02368.is_deleted} = false ;;
}
