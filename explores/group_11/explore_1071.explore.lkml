# Explore: explore_1071
# Auto-generated LookML Explore File

include: "/views/domain_14/view_03214.view.lkml"
include: "/views/domain_16/view_03216.view.lkml"
include: "/views/domain_17/view_03217.view.lkml"
include: "/views/domain_18/view_03218.view.lkml"

explore: explore_1071 {
  label: "Explore Explore 1071"
  description: "Comprehensive analytics explore joining base view_03214 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_03214
  
  always_filter: {
    filters: [view_03214.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03214.created_at_date: "7 days"]
    unless: [view_03214.id, view_03214.status]
  }

  join: view_03216 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03214.user_id} = ${view_03216.id} ;;
    required_joins: []
  }

  join: view_03217 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03214.account_id} = ${view_03217.account_id} ;;
    required_joins: [view_03216]
  }

  join: view_03218 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03214.category} = ${view_03218.category} ;;
  }

  access_filter: {
    field: view_03214.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03214.is_deleted} = false ;;
}
