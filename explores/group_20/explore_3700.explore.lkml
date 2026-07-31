# Update for 2000 file diff target
# Explore: explore_3700
# Auto-generated LookML Explore File

include: "/views/domain_01/view_11101.view.lkml"
include: "/views/domain_03/view_11103.view.lkml"
include: "/views/domain_04/view_11104.view.lkml"
include: "/views/domain_05/view_11105.view.lkml"

explore: explore_3700 {
  label: "Explore Explore 3700"
  description: "Comprehensive analytics explore joining base view_11101 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_11101
  
  always_filter: {
    filters: [view_11101.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11101.created_at_date: "7 days"]
    unless: [view_11101.id, view_11101.status]
  }

  join: view_11103 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11101.user_id} = ${view_11103.id} ;;
    required_joins: []
  }

  join: view_11104 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11101.account_id} = ${view_11104.account_id} ;;
    required_joins: [view_11103]
  }

  join: view_11105 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11101.category} = ${view_11105.category} ;;
  }

  access_filter: {
    field: view_11101.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11101.is_deleted} = false ;;
}
