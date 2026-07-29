# Explore: explore_3165
# Auto-generated LookML Explore File

include: "/views/domain_46/view_09496.view.lkml"
include: "/views/domain_48/view_09498.view.lkml"
include: "/views/domain_49/view_09499.view.lkml"
include: "/views/domain_50/view_09500.view.lkml"

explore: explore_3165 {
  label: "Explore Explore 3165"
  description: "Comprehensive analytics explore joining base view_09496 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_09496
  
  always_filter: {
    filters: [view_09496.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09496.created_at_date: "7 days"]
    unless: [view_09496.id, view_09496.status]
  }

  join: view_09498 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09496.user_id} = ${view_09498.id} ;;
    required_joins: []
  }

  join: view_09499 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09496.account_id} = ${view_09499.account_id} ;;
    required_joins: [view_09498]
  }

  join: view_09500 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09496.category} = ${view_09500.category} ;;
  }

  access_filter: {
    field: view_09496.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09496.is_deleted} = false ;;
}
