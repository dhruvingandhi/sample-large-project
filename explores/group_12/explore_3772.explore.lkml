# Explore: explore_3772
# Auto-generated LookML Explore File

include: "/views/domain_17/view_11317.view.lkml"
include: "/views/domain_19/view_11319.view.lkml"
include: "/views/domain_20/view_11320.view.lkml"
include: "/views/domain_21/view_11321.view.lkml"

explore: explore_3772 {
  label: "Explore Explore 3772"
  description: "Comprehensive analytics explore joining base view_11317 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11317
  
  always_filter: {
    filters: [view_11317.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11317.created_at_date: "7 days"]
    unless: [view_11317.id, view_11317.status]
  }

  join: view_11319 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11317.user_id} = ${view_11319.id} ;;
    required_joins: []
  }

  join: view_11320 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11317.account_id} = ${view_11320.account_id} ;;
    required_joins: [view_11319]
  }

  join: view_11321 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11317.category} = ${view_11321.category} ;;
  }

  access_filter: {
    field: view_11317.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11317.is_deleted} = false ;;
}
