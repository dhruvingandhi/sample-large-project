# Update for 2000 file diff target
# Explore: explore_3179
# Auto-generated LookML Explore File

include: "/views/domain_38/view_09538.view.lkml"
include: "/views/domain_40/view_09540.view.lkml"
include: "/views/domain_41/view_09541.view.lkml"
include: "/views/domain_42/view_09542.view.lkml"

explore: explore_3179 {
  label: "Explore Explore 3179"
  description: "Comprehensive analytics explore joining base view_09538 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_09538
  
  always_filter: {
    filters: [view_09538.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09538.created_at_date: "7 days"]
    unless: [view_09538.id, view_09538.status]
  }

  join: view_09540 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09538.user_id} = ${view_09540.id} ;;
    required_joins: []
  }

  join: view_09541 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09538.account_id} = ${view_09541.account_id} ;;
    required_joins: [view_09540]
  }

  join: view_09542 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09538.category} = ${view_09542.category} ;;
  }

  access_filter: {
    field: view_09538.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09538.is_deleted} = false ;;
}
