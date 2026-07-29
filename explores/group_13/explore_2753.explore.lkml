# Explore: explore_2753
# Auto-generated LookML Explore File

include: "/views/domain_10/view_08260.view.lkml"
include: "/views/domain_12/view_08262.view.lkml"
include: "/views/domain_13/view_08263.view.lkml"
include: "/views/domain_14/view_08264.view.lkml"

explore: explore_2753 {
  label: "Explore Explore 2753"
  description: "Comprehensive analytics explore joining base view_08260 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_08260
  
  always_filter: {
    filters: [view_08260.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08260.created_at_date: "7 days"]
    unless: [view_08260.id, view_08260.status]
  }

  join: view_08262 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08260.user_id} = ${view_08262.id} ;;
    required_joins: []
  }

  join: view_08263 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08260.account_id} = ${view_08263.account_id} ;;
    required_joins: [view_08262]
  }

  join: view_08264 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08260.category} = ${view_08264.category} ;;
  }

  access_filter: {
    field: view_08260.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08260.is_deleted} = false ;;
}
