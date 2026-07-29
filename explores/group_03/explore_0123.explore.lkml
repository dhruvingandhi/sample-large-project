# Explore: explore_0123
# Auto-generated LookML Explore File

include: "/views/domain_20/view_00370.view.lkml"
include: "/views/domain_22/view_00372.view.lkml"
include: "/views/domain_23/view_00373.view.lkml"
include: "/views/domain_24/view_00374.view.lkml"

explore: explore_0123 {
  label: "Explore Explore 0123"
  description: "Comprehensive analytics explore joining base view_00370 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00370
  
  always_filter: {
    filters: [view_00370.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00370.created_at_date: "7 days"]
    unless: [view_00370.id, view_00370.status]
  }

  join: view_00372 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00370.user_id} = ${view_00372.id} ;;
    required_joins: []
  }

  join: view_00373 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00370.account_id} = ${view_00373.account_id} ;;
    required_joins: [view_00372]
  }

  join: view_00374 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00370.category} = ${view_00374.category} ;;
  }

  access_filter: {
    field: view_00370.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00370.is_deleted} = false ;;
}
