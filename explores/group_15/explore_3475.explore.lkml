# Explore: explore_3475
# Auto-generated LookML Explore File

include: "/views/domain_26/view_10426.view.lkml"
include: "/views/domain_28/view_10428.view.lkml"
include: "/views/domain_29/view_10429.view.lkml"
include: "/views/domain_30/view_10430.view.lkml"

explore: explore_3475 {
  label: "Explore Explore 3475"
  description: "Comprehensive analytics explore joining base view_10426 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_10426
  
  always_filter: {
    filters: [view_10426.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10426.created_at_date: "7 days"]
    unless: [view_10426.id, view_10426.status]
  }

  join: view_10428 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10426.user_id} = ${view_10428.id} ;;
    required_joins: []
  }

  join: view_10429 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10426.account_id} = ${view_10429.account_id} ;;
    required_joins: [view_10428]
  }

  join: view_10430 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10426.category} = ${view_10430.category} ;;
  }

  access_filter: {
    field: view_10426.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10426.is_deleted} = false ;;
}
