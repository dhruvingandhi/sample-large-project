# Explore: explore_2538
# Auto-generated LookML Explore File

include: "/views/domain_15/view_07615.view.lkml"
include: "/views/domain_17/view_07617.view.lkml"
include: "/views/domain_18/view_07618.view.lkml"
include: "/views/domain_19/view_07619.view.lkml"

explore: explore_2538 {
  label: "Explore Explore 2538"
  description: "Comprehensive analytics explore joining base view_07615 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07615
  
  always_filter: {
    filters: [view_07615.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07615.created_at_date: "7 days"]
    unless: [view_07615.id, view_07615.status]
  }

  join: view_07617 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07615.user_id} = ${view_07617.id} ;;
    required_joins: []
  }

  join: view_07618 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07615.account_id} = ${view_07618.account_id} ;;
    required_joins: [view_07617]
  }

  join: view_07619 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07615.category} = ${view_07619.category} ;;
  }

  access_filter: {
    field: view_07615.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07615.is_deleted} = false ;;
}
