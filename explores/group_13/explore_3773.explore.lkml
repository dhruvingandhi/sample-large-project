# Explore: explore_3773
# Auto-generated LookML Explore File

include: "/views/domain_20/view_11320.view.lkml"
include: "/views/domain_22/view_11322.view.lkml"
include: "/views/domain_23/view_11323.view.lkml"
include: "/views/domain_24/view_11324.view.lkml"

explore: explore_3773 {
  label: "Explore Explore 3773"
  description: "Comprehensive analytics explore joining base view_11320 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_11320
  
  always_filter: {
    filters: [view_11320.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11320.created_at_date: "7 days"]
    unless: [view_11320.id, view_11320.status]
  }

  join: view_11322 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11320.user_id} = ${view_11322.id} ;;
    required_joins: []
  }

  join: view_11323 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11320.account_id} = ${view_11323.account_id} ;;
    required_joins: [view_11322]
  }

  join: view_11324 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11320.category} = ${view_11324.category} ;;
  }

  access_filter: {
    field: view_11320.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11320.is_deleted} = false ;;
}
