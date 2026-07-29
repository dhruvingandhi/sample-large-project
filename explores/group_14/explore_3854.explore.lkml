# Explore: explore_3854
# Auto-generated LookML Explore File

include: "/views/domain_13/view_11563.view.lkml"
include: "/views/domain_15/view_11565.view.lkml"
include: "/views/domain_16/view_11566.view.lkml"
include: "/views/domain_17/view_11567.view.lkml"

explore: explore_3854 {
  label: "Explore Explore 3854"
  description: "Comprehensive analytics explore joining base view_11563 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_11563
  
  always_filter: {
    filters: [view_11563.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11563.created_at_date: "7 days"]
    unless: [view_11563.id, view_11563.status]
  }

  join: view_11565 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11563.user_id} = ${view_11565.id} ;;
    required_joins: []
  }

  join: view_11566 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11563.account_id} = ${view_11566.account_id} ;;
    required_joins: [view_11565]
  }

  join: view_11567 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11563.category} = ${view_11567.category} ;;
  }

  access_filter: {
    field: view_11563.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11563.is_deleted} = false ;;
}
