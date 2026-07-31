# Update for 500 file diff target
# Explore: explore_3105
# Auto-generated LookML Explore File

include: "/views/domain_16/view_09316.view.lkml"
include: "/views/domain_18/view_09318.view.lkml"
include: "/views/domain_19/view_09319.view.lkml"
include: "/views/domain_20/view_09320.view.lkml"

explore: explore_3105 {
  label: "Explore Explore 3105"
  description: "Comprehensive analytics explore joining base view_09316 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09316
  
  always_filter: {
    filters: [view_09316.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09316.created_at_date: "7 days"]
    unless: [view_09316.id, view_09316.status]
  }

  join: view_09318 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09316.user_id} = ${view_09318.id} ;;
    required_joins: []
  }

  join: view_09319 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09316.account_id} = ${view_09319.account_id} ;;
    required_joins: [view_09318]
  }

  join: view_09320 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09316.category} = ${view_09320.category} ;;
  }

  access_filter: {
    field: view_09316.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09316.is_deleted} = false ;;
}
