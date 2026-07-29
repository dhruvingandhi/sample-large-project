# Explore: explore_0476
# Auto-generated LookML Explore File

include: "/views/domain_29/view_01429.view.lkml"
include: "/views/domain_31/view_01431.view.lkml"
include: "/views/domain_32/view_01432.view.lkml"
include: "/views/domain_33/view_01433.view.lkml"

explore: explore_0476 {
  label: "Explore Explore 0476"
  description: "Comprehensive analytics explore joining base view_01429 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01429
  
  always_filter: {
    filters: [view_01429.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01429.created_at_date: "7 days"]
    unless: [view_01429.id, view_01429.status]
  }

  join: view_01431 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01429.user_id} = ${view_01431.id} ;;
    required_joins: []
  }

  join: view_01432 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01429.account_id} = ${view_01432.account_id} ;;
    required_joins: [view_01431]
  }

  join: view_01433 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01429.category} = ${view_01433.category} ;;
  }

  access_filter: {
    field: view_01429.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01429.is_deleted} = false ;;
}
