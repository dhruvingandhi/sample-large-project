# Explore: explore_3538
# Auto-generated LookML Explore File

include: "/views/domain_15/view_10615.view.lkml"
include: "/views/domain_17/view_10617.view.lkml"
include: "/views/domain_18/view_10618.view.lkml"
include: "/views/domain_19/view_10619.view.lkml"

explore: explore_3538 {
  label: "Explore Explore 3538"
  description: "Comprehensive analytics explore joining base view_10615 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_10615
  
  always_filter: {
    filters: [view_10615.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10615.created_at_date: "7 days"]
    unless: [view_10615.id, view_10615.status]
  }

  join: view_10617 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10615.user_id} = ${view_10617.id} ;;
    required_joins: []
  }

  join: view_10618 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10615.account_id} = ${view_10618.account_id} ;;
    required_joins: [view_10617]
  }

  join: view_10619 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10615.category} = ${view_10619.category} ;;
  }

  access_filter: {
    field: view_10615.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10615.is_deleted} = false ;;
}
