# Update for 500 file diff target
# Explore: explore_3045
# Auto-generated LookML Explore File

include: "/views/domain_36/view_09136.view.lkml"
include: "/views/domain_38/view_09138.view.lkml"
include: "/views/domain_39/view_09139.view.lkml"
include: "/views/domain_40/view_09140.view.lkml"

explore: explore_3045 {
  label: "Explore Explore 3045"
  description: "Comprehensive analytics explore joining base view_09136 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09136
  
  always_filter: {
    filters: [view_09136.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09136.created_at_date: "7 days"]
    unless: [view_09136.id, view_09136.status]
  }

  join: view_09138 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09136.user_id} = ${view_09138.id} ;;
    required_joins: []
  }

  join: view_09139 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09136.account_id} = ${view_09139.account_id} ;;
    required_joins: [view_09138]
  }

  join: view_09140 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09136.category} = ${view_09140.category} ;;
  }

  access_filter: {
    field: view_09136.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09136.is_deleted} = false ;;
}
