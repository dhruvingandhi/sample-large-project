# Explore: explore_0489
# Auto-generated LookML Explore File

include: "/views/domain_18/view_01468.view.lkml"
include: "/views/domain_20/view_01470.view.lkml"
include: "/views/domain_21/view_01471.view.lkml"
include: "/views/domain_22/view_01472.view.lkml"

explore: explore_0489 {
  label: "Explore Explore 0489"
  description: "Comprehensive analytics explore joining base view_01468 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01468
  
  always_filter: {
    filters: [view_01468.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01468.created_at_date: "7 days"]
    unless: [view_01468.id, view_01468.status]
  }

  join: view_01470 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01468.user_id} = ${view_01470.id} ;;
    required_joins: []
  }

  join: view_01471 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01468.account_id} = ${view_01471.account_id} ;;
    required_joins: [view_01470]
  }

  join: view_01472 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01468.category} = ${view_01472.category} ;;
  }

  access_filter: {
    field: view_01468.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01468.is_deleted} = false ;;
}
