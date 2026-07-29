# Explore: explore_0320
# Auto-generated LookML Explore File

include: "/views/domain_11/view_00961.view.lkml"
include: "/views/domain_13/view_00963.view.lkml"
include: "/views/domain_14/view_00964.view.lkml"
include: "/views/domain_15/view_00965.view.lkml"

explore: explore_0320 {
  label: "Explore Explore 0320"
  description: "Comprehensive analytics explore joining base view_00961 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00961
  
  always_filter: {
    filters: [view_00961.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00961.created_at_date: "7 days"]
    unless: [view_00961.id, view_00961.status]
  }

  join: view_00963 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00961.user_id} = ${view_00963.id} ;;
    required_joins: []
  }

  join: view_00964 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00961.account_id} = ${view_00964.account_id} ;;
    required_joins: [view_00963]
  }

  join: view_00965 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00961.category} = ${view_00965.category} ;;
  }

  access_filter: {
    field: view_00961.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00961.is_deleted} = false ;;
}
