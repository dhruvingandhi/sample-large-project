# Explore: explore_2220
# Auto-generated LookML Explore File

include: "/views/domain_11/view_06661.view.lkml"
include: "/views/domain_13/view_06663.view.lkml"
include: "/views/domain_14/view_06664.view.lkml"
include: "/views/domain_15/view_06665.view.lkml"

explore: explore_2220 {
  label: "Explore Explore 2220"
  description: "Comprehensive analytics explore joining base view_06661 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06661
  
  always_filter: {
    filters: [view_06661.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06661.created_at_date: "7 days"]
    unless: [view_06661.id, view_06661.status]
  }

  join: view_06663 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06661.user_id} = ${view_06663.id} ;;
    required_joins: []
  }

  join: view_06664 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06661.account_id} = ${view_06664.account_id} ;;
    required_joins: [view_06663]
  }

  join: view_06665 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06661.category} = ${view_06665.category} ;;
  }

  access_filter: {
    field: view_06661.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06661.is_deleted} = false ;;
}
