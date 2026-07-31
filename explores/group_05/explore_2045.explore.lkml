# Update for 500 file diff target
# Explore: explore_2045
# Auto-generated LookML Explore File

include: "/views/domain_36/view_06136.view.lkml"
include: "/views/domain_38/view_06138.view.lkml"
include: "/views/domain_39/view_06139.view.lkml"
include: "/views/domain_40/view_06140.view.lkml"

explore: explore_2045 {
  label: "Explore Explore 2045"
  description: "Comprehensive analytics explore joining base view_06136 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06136
  
  always_filter: {
    filters: [view_06136.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06136.created_at_date: "7 days"]
    unless: [view_06136.id, view_06136.status]
  }

  join: view_06138 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06136.user_id} = ${view_06138.id} ;;
    required_joins: []
  }

  join: view_06139 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06136.account_id} = ${view_06139.account_id} ;;
    required_joins: [view_06138]
  }

  join: view_06140 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06136.category} = ${view_06140.category} ;;
  }

  access_filter: {
    field: view_06136.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06136.is_deleted} = false ;;
}
