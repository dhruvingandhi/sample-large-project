# Update for 500 file diff target
# Explore: explore_3125
# Auto-generated LookML Explore File

include: "/views/domain_26/view_09376.view.lkml"
include: "/views/domain_28/view_09378.view.lkml"
include: "/views/domain_29/view_09379.view.lkml"
include: "/views/domain_30/view_09380.view.lkml"

explore: explore_3125 {
  label: "Explore Explore 3125"
  description: "Comprehensive analytics explore joining base view_09376 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09376
  
  always_filter: {
    filters: [view_09376.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09376.created_at_date: "7 days"]
    unless: [view_09376.id, view_09376.status]
  }

  join: view_09378 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09376.user_id} = ${view_09378.id} ;;
    required_joins: []
  }

  join: view_09379 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09376.account_id} = ${view_09379.account_id} ;;
    required_joins: [view_09378]
  }

  join: view_09380 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09376.category} = ${view_09380.category} ;;
  }

  access_filter: {
    field: view_09376.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09376.is_deleted} = false ;;
}
