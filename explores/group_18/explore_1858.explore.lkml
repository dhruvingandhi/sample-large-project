# Explore: explore_1858
# Auto-generated LookML Explore File

include: "/views/domain_25/view_05575.view.lkml"
include: "/views/domain_27/view_05577.view.lkml"
include: "/views/domain_28/view_05578.view.lkml"
include: "/views/domain_29/view_05579.view.lkml"

explore: explore_1858 {
  label: "Explore Explore 1858"
  description: "Comprehensive analytics explore joining base view_05575 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_05575
  
  always_filter: {
    filters: [view_05575.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05575.created_at_date: "7 days"]
    unless: [view_05575.id, view_05575.status]
  }

  join: view_05577 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05575.user_id} = ${view_05577.id} ;;
    required_joins: []
  }

  join: view_05578 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05575.account_id} = ${view_05578.account_id} ;;
    required_joins: [view_05577]
  }

  join: view_05579 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05575.category} = ${view_05579.category} ;;
  }

  access_filter: {
    field: view_05575.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05575.is_deleted} = false ;;
}
