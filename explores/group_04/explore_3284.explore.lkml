# Explore: explore_3284
# Auto-generated LookML Explore File

include: "/views/domain_03/view_09853.view.lkml"
include: "/views/domain_05/view_09855.view.lkml"
include: "/views/domain_06/view_09856.view.lkml"
include: "/views/domain_07/view_09857.view.lkml"

explore: explore_3284 {
  label: "Explore Explore 3284"
  description: "Comprehensive analytics explore joining base view_09853 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_09853
  
  always_filter: {
    filters: [view_09853.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09853.created_at_date: "7 days"]
    unless: [view_09853.id, view_09853.status]
  }

  join: view_09855 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09853.user_id} = ${view_09855.id} ;;
    required_joins: []
  }

  join: view_09856 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09853.account_id} = ${view_09856.account_id} ;;
    required_joins: [view_09855]
  }

  join: view_09857 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09853.category} = ${view_09857.category} ;;
  }

  access_filter: {
    field: view_09853.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09853.is_deleted} = false ;;
}
