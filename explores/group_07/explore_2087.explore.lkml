# Explore: explore_2087
# Auto-generated LookML Explore File

include: "/views/domain_12/view_06262.view.lkml"
include: "/views/domain_14/view_06264.view.lkml"
include: "/views/domain_15/view_06265.view.lkml"
include: "/views/domain_16/view_06266.view.lkml"

explore: explore_2087 {
  label: "Explore Explore 2087"
  description: "Comprehensive analytics explore joining base view_06262 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06262
  
  always_filter: {
    filters: [view_06262.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06262.created_at_date: "7 days"]
    unless: [view_06262.id, view_06262.status]
  }

  join: view_06264 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06262.user_id} = ${view_06264.id} ;;
    required_joins: []
  }

  join: view_06265 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06262.account_id} = ${view_06265.account_id} ;;
    required_joins: [view_06264]
  }

  join: view_06266 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06262.category} = ${view_06266.category} ;;
  }

  access_filter: {
    field: view_06262.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06262.is_deleted} = false ;;
}
