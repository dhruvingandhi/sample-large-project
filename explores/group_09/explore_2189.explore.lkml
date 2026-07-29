# Explore: explore_2189
# Auto-generated LookML Explore File

include: "/views/domain_18/view_06568.view.lkml"
include: "/views/domain_20/view_06570.view.lkml"
include: "/views/domain_21/view_06571.view.lkml"
include: "/views/domain_22/view_06572.view.lkml"

explore: explore_2189 {
  label: "Explore Explore 2189"
  description: "Comprehensive analytics explore joining base view_06568 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_06568
  
  always_filter: {
    filters: [view_06568.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06568.created_at_date: "7 days"]
    unless: [view_06568.id, view_06568.status]
  }

  join: view_06570 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06568.user_id} = ${view_06570.id} ;;
    required_joins: []
  }

  join: view_06571 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06568.account_id} = ${view_06571.account_id} ;;
    required_joins: [view_06570]
  }

  join: view_06572 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06568.category} = ${view_06572.category} ;;
  }

  access_filter: {
    field: view_06568.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06568.is_deleted} = false ;;
}
