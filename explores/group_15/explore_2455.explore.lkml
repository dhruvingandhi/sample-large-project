# Explore: explore_2455
# Auto-generated LookML Explore File

include: "/views/domain_16/view_07366.view.lkml"
include: "/views/domain_18/view_07368.view.lkml"
include: "/views/domain_19/view_07369.view.lkml"
include: "/views/domain_20/view_07370.view.lkml"

explore: explore_2455 {
  label: "Explore Explore 2455"
  description: "Comprehensive analytics explore joining base view_07366 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07366
  
  always_filter: {
    filters: [view_07366.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07366.created_at_date: "7 days"]
    unless: [view_07366.id, view_07366.status]
  }

  join: view_07368 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07366.user_id} = ${view_07368.id} ;;
    required_joins: []
  }

  join: view_07369 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07366.account_id} = ${view_07369.account_id} ;;
    required_joins: [view_07368]
  }

  join: view_07370 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07366.category} = ${view_07370.category} ;;
  }

  access_filter: {
    field: view_07366.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07366.is_deleted} = false ;;
}
