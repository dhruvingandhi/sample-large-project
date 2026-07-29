# Explore: explore_2791
# Auto-generated LookML Explore File

include: "/views/domain_24/view_08374.view.lkml"
include: "/views/domain_26/view_08376.view.lkml"
include: "/views/domain_27/view_08377.view.lkml"
include: "/views/domain_28/view_08378.view.lkml"

explore: explore_2791 {
  label: "Explore Explore 2791"
  description: "Comprehensive analytics explore joining base view_08374 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_08374
  
  always_filter: {
    filters: [view_08374.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08374.created_at_date: "7 days"]
    unless: [view_08374.id, view_08374.status]
  }

  join: view_08376 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08374.user_id} = ${view_08376.id} ;;
    required_joins: []
  }

  join: view_08377 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08374.account_id} = ${view_08377.account_id} ;;
    required_joins: [view_08376]
  }

  join: view_08378 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08374.category} = ${view_08378.category} ;;
  }

  access_filter: {
    field: view_08374.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08374.is_deleted} = false ;;
}
