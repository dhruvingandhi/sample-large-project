# Explore: explore_3833
# Auto-generated LookML Explore File

include: "/views/domain_50/view_11500.view.lkml"
include: "/views/domain_02/view_11502.view.lkml"
include: "/views/domain_03/view_11503.view.lkml"
include: "/views/domain_04/view_11504.view.lkml"

explore: explore_3833 {
  label: "Explore Explore 3833"
  description: "Comprehensive analytics explore joining base view_11500 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11500
  
  always_filter: {
    filters: [view_11500.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11500.created_at_date: "7 days"]
    unless: [view_11500.id, view_11500.status]
  }

  join: view_11502 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11500.user_id} = ${view_11502.id} ;;
    required_joins: []
  }

  join: view_11503 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11500.account_id} = ${view_11503.account_id} ;;
    required_joins: [view_11502]
  }

  join: view_11504 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11500.category} = ${view_11504.category} ;;
  }

  access_filter: {
    field: view_11500.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11500.is_deleted} = false ;;
}
