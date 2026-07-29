# Explore: explore_1771
# Auto-generated LookML Explore File

include: "/views/domain_14/view_05314.view.lkml"
include: "/views/domain_16/view_05316.view.lkml"
include: "/views/domain_17/view_05317.view.lkml"
include: "/views/domain_18/view_05318.view.lkml"

explore: explore_1771 {
  label: "Explore Explore 1771"
  description: "Comprehensive analytics explore joining base view_05314 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_05314
  
  always_filter: {
    filters: [view_05314.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05314.created_at_date: "7 days"]
    unless: [view_05314.id, view_05314.status]
  }

  join: view_05316 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05314.user_id} = ${view_05316.id} ;;
    required_joins: []
  }

  join: view_05317 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05314.account_id} = ${view_05317.account_id} ;;
    required_joins: [view_05316]
  }

  join: view_05318 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05314.category} = ${view_05318.category} ;;
  }

  access_filter: {
    field: view_05314.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05314.is_deleted} = false ;;
}
