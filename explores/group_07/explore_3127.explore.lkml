# Explore: explore_3127
# Auto-generated LookML Explore File

include: "/views/domain_32/view_09382.view.lkml"
include: "/views/domain_34/view_09384.view.lkml"
include: "/views/domain_35/view_09385.view.lkml"
include: "/views/domain_36/view_09386.view.lkml"

explore: explore_3127 {
  label: "Explore Explore 3127"
  description: "Comprehensive analytics explore joining base view_09382 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09382
  
  always_filter: {
    filters: [view_09382.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09382.created_at_date: "7 days"]
    unless: [view_09382.id, view_09382.status]
  }

  join: view_09384 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09382.user_id} = ${view_09384.id} ;;
    required_joins: []
  }

  join: view_09385 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09382.account_id} = ${view_09385.account_id} ;;
    required_joins: [view_09384]
  }

  join: view_09386 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09382.category} = ${view_09386.category} ;;
  }

  access_filter: {
    field: view_09382.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09382.is_deleted} = false ;;
}
