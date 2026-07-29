# Explore: explore_3111
# Auto-generated LookML Explore File

include: "/views/domain_34/view_09334.view.lkml"
include: "/views/domain_36/view_09336.view.lkml"
include: "/views/domain_37/view_09337.view.lkml"
include: "/views/domain_38/view_09338.view.lkml"

explore: explore_3111 {
  label: "Explore Explore 3111"
  description: "Comprehensive analytics explore joining base view_09334 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_09334
  
  always_filter: {
    filters: [view_09334.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09334.created_at_date: "7 days"]
    unless: [view_09334.id, view_09334.status]
  }

  join: view_09336 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09334.user_id} = ${view_09336.id} ;;
    required_joins: []
  }

  join: view_09337 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09334.account_id} = ${view_09337.account_id} ;;
    required_joins: [view_09336]
  }

  join: view_09338 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09334.category} = ${view_09338.category} ;;
  }

  access_filter: {
    field: view_09334.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09334.is_deleted} = false ;;
}
