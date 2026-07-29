# Explore: explore_2858
# Auto-generated LookML Explore File

include: "/views/domain_25/view_08575.view.lkml"
include: "/views/domain_27/view_08577.view.lkml"
include: "/views/domain_28/view_08578.view.lkml"
include: "/views/domain_29/view_08579.view.lkml"

explore: explore_2858 {
  label: "Explore Explore 2858"
  description: "Comprehensive analytics explore joining base view_08575 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_08575
  
  always_filter: {
    filters: [view_08575.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08575.created_at_date: "7 days"]
    unless: [view_08575.id, view_08575.status]
  }

  join: view_08577 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08575.user_id} = ${view_08577.id} ;;
    required_joins: []
  }

  join: view_08578 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08575.account_id} = ${view_08578.account_id} ;;
    required_joins: [view_08577]
  }

  join: view_08579 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08575.category} = ${view_08579.category} ;;
  }

  access_filter: {
    field: view_08575.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08575.is_deleted} = false ;;
}
