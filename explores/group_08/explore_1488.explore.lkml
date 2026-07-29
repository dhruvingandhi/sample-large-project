# Explore: explore_1488
# Auto-generated LookML Explore File

include: "/views/domain_15/view_04465.view.lkml"
include: "/views/domain_17/view_04467.view.lkml"
include: "/views/domain_18/view_04468.view.lkml"
include: "/views/domain_19/view_04469.view.lkml"

explore: explore_1488 {
  label: "Explore Explore 1488"
  description: "Comprehensive analytics explore joining base view_04465 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04465
  
  always_filter: {
    filters: [view_04465.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04465.created_at_date: "7 days"]
    unless: [view_04465.id, view_04465.status]
  }

  join: view_04467 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04465.user_id} = ${view_04467.id} ;;
    required_joins: []
  }

  join: view_04468 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04465.account_id} = ${view_04468.account_id} ;;
    required_joins: [view_04467]
  }

  join: view_04469 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04465.category} = ${view_04469.category} ;;
  }

  access_filter: {
    field: view_04465.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04465.is_deleted} = false ;;
}
