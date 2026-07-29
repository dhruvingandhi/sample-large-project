# Explore: explore_0270
# Auto-generated LookML Explore File

include: "/views/domain_11/view_00811.view.lkml"
include: "/views/domain_13/view_00813.view.lkml"
include: "/views/domain_14/view_00814.view.lkml"
include: "/views/domain_15/view_00815.view.lkml"

explore: explore_0270 {
  label: "Explore Explore 0270"
  description: "Comprehensive analytics explore joining base view_00811 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_00811
  
  always_filter: {
    filters: [view_00811.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00811.created_at_date: "7 days"]
    unless: [view_00811.id, view_00811.status]
  }

  join: view_00813 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00811.user_id} = ${view_00813.id} ;;
    required_joins: []
  }

  join: view_00814 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00811.account_id} = ${view_00814.account_id} ;;
    required_joins: [view_00813]
  }

  join: view_00815 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00811.category} = ${view_00815.category} ;;
  }

  access_filter: {
    field: view_00811.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00811.is_deleted} = false ;;
}
