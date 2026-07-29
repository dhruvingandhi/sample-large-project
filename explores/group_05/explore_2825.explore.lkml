# Explore: explore_2825
# Auto-generated LookML Explore File

include: "/views/domain_26/view_08476.view.lkml"
include: "/views/domain_28/view_08478.view.lkml"
include: "/views/domain_29/view_08479.view.lkml"
include: "/views/domain_30/view_08480.view.lkml"

explore: explore_2825 {
  label: "Explore Explore 2825"
  description: "Comprehensive analytics explore joining base view_08476 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_08476
  
  always_filter: {
    filters: [view_08476.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08476.created_at_date: "7 days"]
    unless: [view_08476.id, view_08476.status]
  }

  join: view_08478 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08476.user_id} = ${view_08478.id} ;;
    required_joins: []
  }

  join: view_08479 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08476.account_id} = ${view_08479.account_id} ;;
    required_joins: [view_08478]
  }

  join: view_08480 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08476.category} = ${view_08480.category} ;;
  }

  access_filter: {
    field: view_08476.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08476.is_deleted} = false ;;
}
