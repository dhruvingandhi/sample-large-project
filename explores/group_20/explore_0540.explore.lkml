# Explore: explore_0540
# Auto-generated LookML Explore File

include: "/views/domain_21/view_01621.view.lkml"
include: "/views/domain_23/view_01623.view.lkml"
include: "/views/domain_24/view_01624.view.lkml"
include: "/views/domain_25/view_01625.view.lkml"

explore: explore_0540 {
  label: "Explore Explore 0540"
  description: "Comprehensive analytics explore joining base view_01621 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_01621
  
  always_filter: {
    filters: [view_01621.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01621.created_at_date: "7 days"]
    unless: [view_01621.id, view_01621.status]
  }

  join: view_01623 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01621.user_id} = ${view_01623.id} ;;
    required_joins: []
  }

  join: view_01624 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01621.account_id} = ${view_01624.account_id} ;;
    required_joins: [view_01623]
  }

  join: view_01625 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01621.category} = ${view_01625.category} ;;
  }

  access_filter: {
    field: view_01621.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01621.is_deleted} = false ;;
}
