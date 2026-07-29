# Explore: explore_3168
# Auto-generated LookML Explore File

include: "/views/domain_05/view_09505.view.lkml"
include: "/views/domain_07/view_09507.view.lkml"
include: "/views/domain_08/view_09508.view.lkml"
include: "/views/domain_09/view_09509.view.lkml"

explore: explore_3168 {
  label: "Explore Explore 3168"
  description: "Comprehensive analytics explore joining base view_09505 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_09505
  
  always_filter: {
    filters: [view_09505.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09505.created_at_date: "7 days"]
    unless: [view_09505.id, view_09505.status]
  }

  join: view_09507 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09505.user_id} = ${view_09507.id} ;;
    required_joins: []
  }

  join: view_09508 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09505.account_id} = ${view_09508.account_id} ;;
    required_joins: [view_09507]
  }

  join: view_09509 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09505.category} = ${view_09509.category} ;;
  }

  access_filter: {
    field: view_09505.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09505.is_deleted} = false ;;
}
