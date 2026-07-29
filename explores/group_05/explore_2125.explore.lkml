# Explore: explore_2125
# Auto-generated LookML Explore File

include: "/views/domain_26/view_06376.view.lkml"
include: "/views/domain_28/view_06378.view.lkml"
include: "/views/domain_29/view_06379.view.lkml"
include: "/views/domain_30/view_06380.view.lkml"

explore: explore_2125 {
  label: "Explore Explore 2125"
  description: "Comprehensive analytics explore joining base view_06376 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_06376
  
  always_filter: {
    filters: [view_06376.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06376.created_at_date: "7 days"]
    unless: [view_06376.id, view_06376.status]
  }

  join: view_06378 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06376.user_id} = ${view_06378.id} ;;
    required_joins: []
  }

  join: view_06379 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06376.account_id} = ${view_06379.account_id} ;;
    required_joins: [view_06378]
  }

  join: view_06380 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06376.category} = ${view_06380.category} ;;
  }

  access_filter: {
    field: view_06376.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06376.is_deleted} = false ;;
}
