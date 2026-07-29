# Explore: explore_3476
# Auto-generated LookML Explore File

include: "/views/domain_29/view_10429.view.lkml"
include: "/views/domain_31/view_10431.view.lkml"
include: "/views/domain_32/view_10432.view.lkml"
include: "/views/domain_33/view_10433.view.lkml"

explore: explore_3476 {
  label: "Explore Explore 3476"
  description: "Comprehensive analytics explore joining base view_10429 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10429
  
  always_filter: {
    filters: [view_10429.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10429.created_at_date: "7 days"]
    unless: [view_10429.id, view_10429.status]
  }

  join: view_10431 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10429.user_id} = ${view_10431.id} ;;
    required_joins: []
  }

  join: view_10432 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10429.account_id} = ${view_10432.account_id} ;;
    required_joins: [view_10431]
  }

  join: view_10433 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10429.category} = ${view_10433.category} ;;
  }

  access_filter: {
    field: view_10429.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10429.is_deleted} = false ;;
}
