# Explore: explore_0542
# Auto-generated LookML Explore File

include: "/views/domain_27/view_01627.view.lkml"
include: "/views/domain_29/view_01629.view.lkml"
include: "/views/domain_30/view_01630.view.lkml"
include: "/views/domain_31/view_01631.view.lkml"

explore: explore_0542 {
  label: "Explore Explore 0542"
  description: "Comprehensive analytics explore joining base view_01627 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01627
  
  always_filter: {
    filters: [view_01627.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01627.created_at_date: "7 days"]
    unless: [view_01627.id, view_01627.status]
  }

  join: view_01629 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01627.user_id} = ${view_01629.id} ;;
    required_joins: []
  }

  join: view_01630 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01627.account_id} = ${view_01630.account_id} ;;
    required_joins: [view_01629]
  }

  join: view_01631 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01627.category} = ${view_01631.category} ;;
  }

  access_filter: {
    field: view_01627.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01627.is_deleted} = false ;;
}
