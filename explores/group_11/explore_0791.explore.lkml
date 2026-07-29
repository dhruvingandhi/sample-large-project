# Explore: explore_0791
# Auto-generated LookML Explore File

include: "/views/domain_24/view_02374.view.lkml"
include: "/views/domain_26/view_02376.view.lkml"
include: "/views/domain_27/view_02377.view.lkml"
include: "/views/domain_28/view_02378.view.lkml"

explore: explore_0791 {
  label: "Explore Explore 0791"
  description: "Comprehensive analytics explore joining base view_02374 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02374
  
  always_filter: {
    filters: [view_02374.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02374.created_at_date: "7 days"]
    unless: [view_02374.id, view_02374.status]
  }

  join: view_02376 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02374.user_id} = ${view_02376.id} ;;
    required_joins: []
  }

  join: view_02377 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02374.account_id} = ${view_02377.account_id} ;;
    required_joins: [view_02376]
  }

  join: view_02378 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02374.category} = ${view_02378.category} ;;
  }

  access_filter: {
    field: view_02374.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02374.is_deleted} = false ;;
}
