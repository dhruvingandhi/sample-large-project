# Explore: explore_0170
# Auto-generated LookML Explore File

include: "/views/domain_11/view_00511.view.lkml"
include: "/views/domain_13/view_00513.view.lkml"
include: "/views/domain_14/view_00514.view.lkml"
include: "/views/domain_15/view_00515.view.lkml"

explore: explore_0170 {
  label: "Explore Explore 0170"
  description: "Comprehensive analytics explore joining base view_00511 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00511
  
  always_filter: {
    filters: [view_00511.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00511.created_at_date: "7 days"]
    unless: [view_00511.id, view_00511.status]
  }

  join: view_00513 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00511.user_id} = ${view_00513.id} ;;
    required_joins: []
  }

  join: view_00514 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00511.account_id} = ${view_00514.account_id} ;;
    required_joins: [view_00513]
  }

  join: view_00515 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00511.category} = ${view_00515.category} ;;
  }

  access_filter: {
    field: view_00511.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00511.is_deleted} = false ;;
}
