# Update for 2000 file diff target
# Explore: explore_1919
# Auto-generated LookML Explore File

include: "/views/domain_08/view_05758.view.lkml"
include: "/views/domain_10/view_05760.view.lkml"
include: "/views/domain_11/view_05761.view.lkml"
include: "/views/domain_12/view_05762.view.lkml"

explore: explore_1919 {
  label: "Explore Explore 1919"
  description: "Comprehensive analytics explore joining base view_05758 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05758
  
  always_filter: {
    filters: [view_05758.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05758.created_at_date: "7 days"]
    unless: [view_05758.id, view_05758.status]
  }

  join: view_05760 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05758.user_id} = ${view_05760.id} ;;
    required_joins: []
  }

  join: view_05761 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05758.account_id} = ${view_05761.account_id} ;;
    required_joins: [view_05760]
  }

  join: view_05762 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05758.category} = ${view_05762.category} ;;
  }

  access_filter: {
    field: view_05758.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05758.is_deleted} = false ;;
}
