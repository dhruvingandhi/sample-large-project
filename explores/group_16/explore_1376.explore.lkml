# Explore: explore_1376
# Auto-generated LookML Explore File

include: "/views/domain_29/view_04129.view.lkml"
include: "/views/domain_31/view_04131.view.lkml"
include: "/views/domain_32/view_04132.view.lkml"
include: "/views/domain_33/view_04133.view.lkml"

explore: explore_1376 {
  label: "Explore Explore 1376"
  description: "Comprehensive analytics explore joining base view_04129 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_04129
  
  always_filter: {
    filters: [view_04129.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04129.created_at_date: "7 days"]
    unless: [view_04129.id, view_04129.status]
  }

  join: view_04131 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04129.user_id} = ${view_04131.id} ;;
    required_joins: []
  }

  join: view_04132 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04129.account_id} = ${view_04132.account_id} ;;
    required_joins: [view_04131]
  }

  join: view_04133 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04129.category} = ${view_04133.category} ;;
  }

  access_filter: {
    field: view_04129.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04129.is_deleted} = false ;;
}
