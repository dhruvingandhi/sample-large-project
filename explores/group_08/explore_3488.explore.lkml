# Explore: explore_3488
# Auto-generated LookML Explore File

include: "/views/domain_15/view_10465.view.lkml"
include: "/views/domain_17/view_10467.view.lkml"
include: "/views/domain_18/view_10468.view.lkml"
include: "/views/domain_19/view_10469.view.lkml"

explore: explore_3488 {
  label: "Explore Explore 3488"
  description: "Comprehensive analytics explore joining base view_10465 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10465
  
  always_filter: {
    filters: [view_10465.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10465.created_at_date: "7 days"]
    unless: [view_10465.id, view_10465.status]
  }

  join: view_10467 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10465.user_id} = ${view_10467.id} ;;
    required_joins: []
  }

  join: view_10468 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10465.account_id} = ${view_10468.account_id} ;;
    required_joins: [view_10467]
  }

  join: view_10469 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10465.category} = ${view_10469.category} ;;
  }

  access_filter: {
    field: view_10465.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10465.is_deleted} = false ;;
}
