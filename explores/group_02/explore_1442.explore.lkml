# Explore: explore_1442
# Auto-generated LookML Explore File

include: "/views/domain_27/view_04327.view.lkml"
include: "/views/domain_29/view_04329.view.lkml"
include: "/views/domain_30/view_04330.view.lkml"
include: "/views/domain_31/view_04331.view.lkml"

explore: explore_1442 {
  label: "Explore Explore 1442"
  description: "Comprehensive analytics explore joining base view_04327 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04327
  
  always_filter: {
    filters: [view_04327.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04327.created_at_date: "7 days"]
    unless: [view_04327.id, view_04327.status]
  }

  join: view_04329 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04327.user_id} = ${view_04329.id} ;;
    required_joins: []
  }

  join: view_04330 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04327.account_id} = ${view_04330.account_id} ;;
    required_joins: [view_04329]
  }

  join: view_04331 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04327.category} = ${view_04331.category} ;;
  }

  access_filter: {
    field: view_04327.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04327.is_deleted} = false ;;
}
