# Explore: explore_0874
# Auto-generated LookML Explore File

include: "/views/domain_23/view_02623.view.lkml"
include: "/views/domain_25/view_02625.view.lkml"
include: "/views/domain_26/view_02626.view.lkml"
include: "/views/domain_27/view_02627.view.lkml"

explore: explore_0874 {
  label: "Explore Explore 0874"
  description: "Comprehensive analytics explore joining base view_02623 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_02623
  
  always_filter: {
    filters: [view_02623.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02623.created_at_date: "7 days"]
    unless: [view_02623.id, view_02623.status]
  }

  join: view_02625 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02623.user_id} = ${view_02625.id} ;;
    required_joins: []
  }

  join: view_02626 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02623.account_id} = ${view_02626.account_id} ;;
    required_joins: [view_02625]
  }

  join: view_02627 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02623.category} = ${view_02627.category} ;;
  }

  access_filter: {
    field: view_02623.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02623.is_deleted} = false ;;
}
