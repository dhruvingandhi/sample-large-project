# Explore: explore_0475
# Auto-generated LookML Explore File

include: "/views/domain_26/view_01426.view.lkml"
include: "/views/domain_28/view_01428.view.lkml"
include: "/views/domain_29/view_01429.view.lkml"
include: "/views/domain_30/view_01430.view.lkml"

explore: explore_0475 {
  label: "Explore Explore 0475"
  description: "Comprehensive analytics explore joining base view_01426 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01426
  
  always_filter: {
    filters: [view_01426.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01426.created_at_date: "7 days"]
    unless: [view_01426.id, view_01426.status]
  }

  join: view_01428 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01426.user_id} = ${view_01428.id} ;;
    required_joins: []
  }

  join: view_01429 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01426.account_id} = ${view_01429.account_id} ;;
    required_joins: [view_01428]
  }

  join: view_01430 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01426.category} = ${view_01430.category} ;;
  }

  access_filter: {
    field: view_01426.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01426.is_deleted} = false ;;
}
