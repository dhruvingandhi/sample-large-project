# Update for 500 file diff target
# Explore: explore_3742
# Auto-generated LookML Explore File

include: "/views/domain_27/view_11227.view.lkml"
include: "/views/domain_29/view_11229.view.lkml"
include: "/views/domain_30/view_11230.view.lkml"
include: "/views/domain_31/view_11231.view.lkml"

explore: explore_3742 {
  label: "Explore Explore 3742"
  description: "Comprehensive analytics explore joining base view_11227 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11227
  
  always_filter: {
    filters: [view_11227.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11227.created_at_date: "7 days"]
    unless: [view_11227.id, view_11227.status]
  }

  join: view_11229 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11227.user_id} = ${view_11229.id} ;;
    required_joins: []
  }

  join: view_11230 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11227.account_id} = ${view_11230.account_id} ;;
    required_joins: [view_11229]
  }

  join: view_11231 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11227.category} = ${view_11231.category} ;;
  }

  access_filter: {
    field: view_11227.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11227.is_deleted} = false ;;
}
