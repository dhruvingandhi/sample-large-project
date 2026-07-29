# Explore: explore_3791
# Auto-generated LookML Explore File

include: "/views/domain_24/view_11374.view.lkml"
include: "/views/domain_26/view_11376.view.lkml"
include: "/views/domain_27/view_11377.view.lkml"
include: "/views/domain_28/view_11378.view.lkml"

explore: explore_3791 {
  label: "Explore Explore 3791"
  description: "Comprehensive analytics explore joining base view_11374 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_11374
  
  always_filter: {
    filters: [view_11374.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11374.created_at_date: "7 days"]
    unless: [view_11374.id, view_11374.status]
  }

  join: view_11376 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11374.user_id} = ${view_11376.id} ;;
    required_joins: []
  }

  join: view_11377 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11374.account_id} = ${view_11377.account_id} ;;
    required_joins: [view_11376]
  }

  join: view_11378 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11374.category} = ${view_11378.category} ;;
  }

  access_filter: {
    field: view_11374.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11374.is_deleted} = false ;;
}
