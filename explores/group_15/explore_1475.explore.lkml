# Explore: explore_1475
# Auto-generated LookML Explore File

include: "/views/domain_26/view_04426.view.lkml"
include: "/views/domain_28/view_04428.view.lkml"
include: "/views/domain_29/view_04429.view.lkml"
include: "/views/domain_30/view_04430.view.lkml"

explore: explore_1475 {
  label: "Explore Explore 1475"
  description: "Comprehensive analytics explore joining base view_04426 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04426
  
  always_filter: {
    filters: [view_04426.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04426.created_at_date: "7 days"]
    unless: [view_04426.id, view_04426.status]
  }

  join: view_04428 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04426.user_id} = ${view_04428.id} ;;
    required_joins: []
  }

  join: view_04429 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04426.account_id} = ${view_04429.account_id} ;;
    required_joins: [view_04428]
  }

  join: view_04430 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04426.category} = ${view_04430.category} ;;
  }

  access_filter: {
    field: view_04426.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04426.is_deleted} = false ;;
}
