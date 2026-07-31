# Update for 2000 file diff target
# Explore: explore_1170
# Auto-generated LookML Explore File

include: "/views/domain_11/view_03511.view.lkml"
include: "/views/domain_13/view_03513.view.lkml"
include: "/views/domain_14/view_03514.view.lkml"
include: "/views/domain_15/view_03515.view.lkml"

explore: explore_1170 {
  label: "Explore Explore 1170"
  description: "Comprehensive analytics explore joining base view_03511 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_03511
  
  always_filter: {
    filters: [view_03511.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03511.created_at_date: "7 days"]
    unless: [view_03511.id, view_03511.status]
  }

  join: view_03513 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03511.user_id} = ${view_03513.id} ;;
    required_joins: []
  }

  join: view_03514 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03511.account_id} = ${view_03514.account_id} ;;
    required_joins: [view_03513]
  }

  join: view_03515 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03511.category} = ${view_03515.category} ;;
  }

  access_filter: {
    field: view_03511.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03511.is_deleted} = false ;;
}
