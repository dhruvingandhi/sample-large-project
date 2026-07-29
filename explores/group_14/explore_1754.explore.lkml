# Explore: explore_1754
# Auto-generated LookML Explore File

include: "/views/domain_13/view_05263.view.lkml"
include: "/views/domain_15/view_05265.view.lkml"
include: "/views/domain_16/view_05266.view.lkml"
include: "/views/domain_17/view_05267.view.lkml"

explore: explore_1754 {
  label: "Explore Explore 1754"
  description: "Comprehensive analytics explore joining base view_05263 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05263
  
  always_filter: {
    filters: [view_05263.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05263.created_at_date: "7 days"]
    unless: [view_05263.id, view_05263.status]
  }

  join: view_05265 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05263.user_id} = ${view_05265.id} ;;
    required_joins: []
  }

  join: view_05266 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05263.account_id} = ${view_05266.account_id} ;;
    required_joins: [view_05265]
  }

  join: view_05267 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05263.category} = ${view_05267.category} ;;
  }

  access_filter: {
    field: view_05263.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05263.is_deleted} = false ;;
}
