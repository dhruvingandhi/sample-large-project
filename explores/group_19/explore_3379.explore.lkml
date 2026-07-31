# Update for 2000 file diff target
# Explore: explore_3379
# Auto-generated LookML Explore File

include: "/views/domain_38/view_10138.view.lkml"
include: "/views/domain_40/view_10140.view.lkml"
include: "/views/domain_41/view_10141.view.lkml"
include: "/views/domain_42/view_10142.view.lkml"

explore: explore_3379 {
  label: "Explore Explore 3379"
  description: "Comprehensive analytics explore joining base view_10138 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10138
  
  always_filter: {
    filters: [view_10138.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10138.created_at_date: "7 days"]
    unless: [view_10138.id, view_10138.status]
  }

  join: view_10140 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10138.user_id} = ${view_10140.id} ;;
    required_joins: []
  }

  join: view_10141 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10138.account_id} = ${view_10141.account_id} ;;
    required_joins: [view_10140]
  }

  join: view_10142 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10138.category} = ${view_10142.category} ;;
  }

  access_filter: {
    field: view_10138.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10138.is_deleted} = false ;;
}
