# Explore: explore_3128
# Auto-generated LookML Explore File

include: "/views/domain_35/view_09385.view.lkml"
include: "/views/domain_37/view_09387.view.lkml"
include: "/views/domain_38/view_09388.view.lkml"
include: "/views/domain_39/view_09389.view.lkml"

explore: explore_3128 {
  label: "Explore Explore 3128"
  description: "Comprehensive analytics explore joining base view_09385 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09385
  
  always_filter: {
    filters: [view_09385.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09385.created_at_date: "7 days"]
    unless: [view_09385.id, view_09385.status]
  }

  join: view_09387 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09385.user_id} = ${view_09387.id} ;;
    required_joins: []
  }

  join: view_09388 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09385.account_id} = ${view_09388.account_id} ;;
    required_joins: [view_09387]
  }

  join: view_09389 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09385.category} = ${view_09389.category} ;;
  }

  access_filter: {
    field: view_09385.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09385.is_deleted} = false ;;
}
