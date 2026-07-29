# Explore: explore_3869
# Auto-generated LookML Explore File

include: "/views/domain_08/view_11608.view.lkml"
include: "/views/domain_10/view_11610.view.lkml"
include: "/views/domain_11/view_11611.view.lkml"
include: "/views/domain_12/view_11612.view.lkml"

explore: explore_3869 {
  label: "Explore Explore 3869"
  description: "Comprehensive analytics explore joining base view_11608 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11608
  
  always_filter: {
    filters: [view_11608.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11608.created_at_date: "7 days"]
    unless: [view_11608.id, view_11608.status]
  }

  join: view_11610 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11608.user_id} = ${view_11610.id} ;;
    required_joins: []
  }

  join: view_11611 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11608.account_id} = ${view_11611.account_id} ;;
    required_joins: [view_11610]
  }

  join: view_11612 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11608.category} = ${view_11612.category} ;;
  }

  access_filter: {
    field: view_11608.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11608.is_deleted} = false ;;
}
