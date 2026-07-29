# Explore: explore_3825
# Auto-generated LookML Explore File

include: "/views/domain_26/view_11476.view.lkml"
include: "/views/domain_28/view_11478.view.lkml"
include: "/views/domain_29/view_11479.view.lkml"
include: "/views/domain_30/view_11480.view.lkml"

explore: explore_3825 {
  label: "Explore Explore 3825"
  description: "Comprehensive analytics explore joining base view_11476 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_11476
  
  always_filter: {
    filters: [view_11476.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11476.created_at_date: "7 days"]
    unless: [view_11476.id, view_11476.status]
  }

  join: view_11478 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11476.user_id} = ${view_11478.id} ;;
    required_joins: []
  }

  join: view_11479 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11476.account_id} = ${view_11479.account_id} ;;
    required_joins: [view_11478]
  }

  join: view_11480 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11476.category} = ${view_11480.category} ;;
  }

  access_filter: {
    field: view_11476.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11476.is_deleted} = false ;;
}
