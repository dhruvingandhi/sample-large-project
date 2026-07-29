# Explore: explore_2427
# Auto-generated LookML Explore File

include: "/views/domain_32/view_07282.view.lkml"
include: "/views/domain_34/view_07284.view.lkml"
include: "/views/domain_35/view_07285.view.lkml"
include: "/views/domain_36/view_07286.view.lkml"

explore: explore_2427 {
  label: "Explore Explore 2427"
  description: "Comprehensive analytics explore joining base view_07282 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_07282
  
  always_filter: {
    filters: [view_07282.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07282.created_at_date: "7 days"]
    unless: [view_07282.id, view_07282.status]
  }

  join: view_07284 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07282.user_id} = ${view_07284.id} ;;
    required_joins: []
  }

  join: view_07285 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07282.account_id} = ${view_07285.account_id} ;;
    required_joins: [view_07284]
  }

  join: view_07286 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07282.category} = ${view_07286.category} ;;
  }

  access_filter: {
    field: view_07282.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07282.is_deleted} = false ;;
}
