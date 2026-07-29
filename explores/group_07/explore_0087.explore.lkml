# Explore: explore_0087
# Auto-generated LookML Explore File

include: "/views/domain_12/view_00262.view.lkml"
include: "/views/domain_14/view_00264.view.lkml"
include: "/views/domain_15/view_00265.view.lkml"
include: "/views/domain_16/view_00266.view.lkml"

explore: explore_0087 {
  label: "Explore Explore 0087"
  description: "Comprehensive analytics explore joining base view_00262 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00262
  
  always_filter: {
    filters: [view_00262.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00262.created_at_date: "7 days"]
    unless: [view_00262.id, view_00262.status]
  }

  join: view_00264 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00262.user_id} = ${view_00264.id} ;;
    required_joins: []
  }

  join: view_00265 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00262.account_id} = ${view_00265.account_id} ;;
    required_joins: [view_00264]
  }

  join: view_00266 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00262.category} = ${view_00266.category} ;;
  }

  access_filter: {
    field: view_00262.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00262.is_deleted} = false ;;
}
