# Explore: explore_1476
# Auto-generated LookML Explore File

include: "/views/domain_29/view_04429.view.lkml"
include: "/views/domain_31/view_04431.view.lkml"
include: "/views/domain_32/view_04432.view.lkml"
include: "/views/domain_33/view_04433.view.lkml"

explore: explore_1476 {
  label: "Explore Explore 1476"
  description: "Comprehensive analytics explore joining base view_04429 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04429
  
  always_filter: {
    filters: [view_04429.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04429.created_at_date: "7 days"]
    unless: [view_04429.id, view_04429.status]
  }

  join: view_04431 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04429.user_id} = ${view_04431.id} ;;
    required_joins: []
  }

  join: view_04432 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04429.account_id} = ${view_04432.account_id} ;;
    required_joins: [view_04431]
  }

  join: view_04433 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04429.category} = ${view_04433.category} ;;
  }

  access_filter: {
    field: view_04429.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04429.is_deleted} = false ;;
}
