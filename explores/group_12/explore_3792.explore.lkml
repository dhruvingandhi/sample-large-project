# Explore: explore_3792
# Auto-generated LookML Explore File

include: "/views/domain_27/view_11377.view.lkml"
include: "/views/domain_29/view_11379.view.lkml"
include: "/views/domain_30/view_11380.view.lkml"
include: "/views/domain_31/view_11381.view.lkml"

explore: explore_3792 {
  label: "Explore Explore 3792"
  description: "Comprehensive analytics explore joining base view_11377 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11377
  
  always_filter: {
    filters: [view_11377.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11377.created_at_date: "7 days"]
    unless: [view_11377.id, view_11377.status]
  }

  join: view_11379 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11377.user_id} = ${view_11379.id} ;;
    required_joins: []
  }

  join: view_11380 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11377.account_id} = ${view_11380.account_id} ;;
    required_joins: [view_11379]
  }

  join: view_11381 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11377.category} = ${view_11381.category} ;;
  }

  access_filter: {
    field: view_11377.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11377.is_deleted} = false ;;
}
