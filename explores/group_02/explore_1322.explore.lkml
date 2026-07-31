# Update for 500 file diff target
# Explore: explore_1322
# Auto-generated LookML Explore File

include: "/views/domain_17/view_03967.view.lkml"
include: "/views/domain_19/view_03969.view.lkml"
include: "/views/domain_20/view_03970.view.lkml"
include: "/views/domain_21/view_03971.view.lkml"

explore: explore_1322 {
  label: "Explore Explore 1322"
  description: "Comprehensive analytics explore joining base view_03967 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_03967
  
  always_filter: {
    filters: [view_03967.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03967.created_at_date: "7 days"]
    unless: [view_03967.id, view_03967.status]
  }

  join: view_03969 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03967.user_id} = ${view_03969.id} ;;
    required_joins: []
  }

  join: view_03970 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03967.account_id} = ${view_03970.account_id} ;;
    required_joins: [view_03969]
  }

  join: view_03971 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03967.category} = ${view_03971.category} ;;
  }

  access_filter: {
    field: view_03967.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03967.is_deleted} = false ;;
}
