# Explore: explore_3124
# Auto-generated LookML Explore File

include: "/views/domain_23/view_09373.view.lkml"
include: "/views/domain_25/view_09375.view.lkml"
include: "/views/domain_26/view_09376.view.lkml"
include: "/views/domain_27/view_09377.view.lkml"

explore: explore_3124 {
  label: "Explore Explore 3124"
  description: "Comprehensive analytics explore joining base view_09373 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09373
  
  always_filter: {
    filters: [view_09373.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09373.created_at_date: "7 days"]
    unless: [view_09373.id, view_09373.status]
  }

  join: view_09375 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09373.user_id} = ${view_09375.id} ;;
    required_joins: []
  }

  join: view_09376 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09373.account_id} = ${view_09376.account_id} ;;
    required_joins: [view_09375]
  }

  join: view_09377 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09373.category} = ${view_09377.category} ;;
  }

  access_filter: {
    field: view_09373.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09373.is_deleted} = false ;;
}
