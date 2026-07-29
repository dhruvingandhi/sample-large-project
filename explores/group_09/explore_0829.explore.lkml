# Explore: explore_0829
# Auto-generated LookML Explore File

include: "/views/domain_38/view_02488.view.lkml"
include: "/views/domain_40/view_02490.view.lkml"
include: "/views/domain_41/view_02491.view.lkml"
include: "/views/domain_42/view_02492.view.lkml"

explore: explore_0829 {
  label: "Explore Explore 0829"
  description: "Comprehensive analytics explore joining base view_02488 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02488
  
  always_filter: {
    filters: [view_02488.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02488.created_at_date: "7 days"]
    unless: [view_02488.id, view_02488.status]
  }

  join: view_02490 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02488.user_id} = ${view_02490.id} ;;
    required_joins: []
  }

  join: view_02491 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02488.account_id} = ${view_02491.account_id} ;;
    required_joins: [view_02490]
  }

  join: view_02492 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02488.category} = ${view_02492.category} ;;
  }

  access_filter: {
    field: view_02488.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02488.is_deleted} = false ;;
}
