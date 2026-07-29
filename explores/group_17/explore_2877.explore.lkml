# Explore: explore_2877
# Auto-generated LookML Explore File

include: "/views/domain_32/view_08632.view.lkml"
include: "/views/domain_34/view_08634.view.lkml"
include: "/views/domain_35/view_08635.view.lkml"
include: "/views/domain_36/view_08636.view.lkml"

explore: explore_2877 {
  label: "Explore Explore 2877"
  description: "Comprehensive analytics explore joining base view_08632 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08632
  
  always_filter: {
    filters: [view_08632.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08632.created_at_date: "7 days"]
    unless: [view_08632.id, view_08632.status]
  }

  join: view_08634 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08632.user_id} = ${view_08634.id} ;;
    required_joins: []
  }

  join: view_08635 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08632.account_id} = ${view_08635.account_id} ;;
    required_joins: [view_08634]
  }

  join: view_08636 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08632.category} = ${view_08636.category} ;;
  }

  access_filter: {
    field: view_08632.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08632.is_deleted} = false ;;
}
