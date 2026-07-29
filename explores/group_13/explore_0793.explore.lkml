# Explore: explore_0793
# Auto-generated LookML Explore File

include: "/views/domain_30/view_02380.view.lkml"
include: "/views/domain_32/view_02382.view.lkml"
include: "/views/domain_33/view_02383.view.lkml"
include: "/views/domain_34/view_02384.view.lkml"

explore: explore_0793 {
  label: "Explore Explore 0793"
  description: "Comprehensive analytics explore joining base view_02380 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02380
  
  always_filter: {
    filters: [view_02380.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02380.created_at_date: "7 days"]
    unless: [view_02380.id, view_02380.status]
  }

  join: view_02382 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02380.user_id} = ${view_02382.id} ;;
    required_joins: []
  }

  join: view_02383 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02380.account_id} = ${view_02383.account_id} ;;
    required_joins: [view_02382]
  }

  join: view_02384 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02380.category} = ${view_02384.category} ;;
  }

  access_filter: {
    field: view_02380.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02380.is_deleted} = false ;;
}
