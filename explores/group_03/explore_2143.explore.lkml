# Explore: explore_2143
# Auto-generated LookML Explore File

include: "/views/domain_30/view_06430.view.lkml"
include: "/views/domain_32/view_06432.view.lkml"
include: "/views/domain_33/view_06433.view.lkml"
include: "/views/domain_34/view_06434.view.lkml"

explore: explore_2143 {
  label: "Explore Explore 2143"
  description: "Comprehensive analytics explore joining base view_06430 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06430
  
  always_filter: {
    filters: [view_06430.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06430.created_at_date: "7 days"]
    unless: [view_06430.id, view_06430.status]
  }

  join: view_06432 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06430.user_id} = ${view_06432.id} ;;
    required_joins: []
  }

  join: view_06433 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06430.account_id} = ${view_06433.account_id} ;;
    required_joins: [view_06432]
  }

  join: view_06434 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06430.category} = ${view_06434.category} ;;
  }

  access_filter: {
    field: view_06430.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06430.is_deleted} = false ;;
}
