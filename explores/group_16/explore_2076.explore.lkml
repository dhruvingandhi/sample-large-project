# Explore: explore_2076
# Auto-generated LookML Explore File

include: "/views/domain_29/view_06229.view.lkml"
include: "/views/domain_31/view_06231.view.lkml"
include: "/views/domain_32/view_06232.view.lkml"
include: "/views/domain_33/view_06233.view.lkml"

explore: explore_2076 {
  label: "Explore Explore 2076"
  description: "Comprehensive analytics explore joining base view_06229 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_06229
  
  always_filter: {
    filters: [view_06229.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06229.created_at_date: "7 days"]
    unless: [view_06229.id, view_06229.status]
  }

  join: view_06231 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06229.user_id} = ${view_06231.id} ;;
    required_joins: []
  }

  join: view_06232 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06229.account_id} = ${view_06232.account_id} ;;
    required_joins: [view_06231]
  }

  join: view_06233 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06229.category} = ${view_06233.category} ;;
  }

  access_filter: {
    field: view_06229.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06229.is_deleted} = false ;;
}
