# Explore: explore_0538
# Auto-generated LookML Explore File

include: "/views/domain_15/view_01615.view.lkml"
include: "/views/domain_17/view_01617.view.lkml"
include: "/views/domain_18/view_01618.view.lkml"
include: "/views/domain_19/view_01619.view.lkml"

explore: explore_0538 {
  label: "Explore Explore 0538"
  description: "Comprehensive analytics explore joining base view_01615 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_01615
  
  always_filter: {
    filters: [view_01615.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01615.created_at_date: "7 days"]
    unless: [view_01615.id, view_01615.status]
  }

  join: view_01617 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01615.user_id} = ${view_01617.id} ;;
    required_joins: []
  }

  join: view_01618 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01615.account_id} = ${view_01618.account_id} ;;
    required_joins: [view_01617]
  }

  join: view_01619 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01615.category} = ${view_01619.category} ;;
  }

  access_filter: {
    field: view_01615.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01615.is_deleted} = false ;;
}
