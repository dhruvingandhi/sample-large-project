# Explore: explore_2284
# Auto-generated LookML Explore File

include: "/views/domain_03/view_06853.view.lkml"
include: "/views/domain_05/view_06855.view.lkml"
include: "/views/domain_06/view_06856.view.lkml"
include: "/views/domain_07/view_06857.view.lkml"

explore: explore_2284 {
  label: "Explore Explore 2284"
  description: "Comprehensive analytics explore joining base view_06853 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06853
  
  always_filter: {
    filters: [view_06853.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06853.created_at_date: "7 days"]
    unless: [view_06853.id, view_06853.status]
  }

  join: view_06855 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06853.user_id} = ${view_06855.id} ;;
    required_joins: []
  }

  join: view_06856 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06853.account_id} = ${view_06856.account_id} ;;
    required_joins: [view_06855]
  }

  join: view_06857 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06853.category} = ${view_06857.category} ;;
  }

  access_filter: {
    field: view_06853.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06853.is_deleted} = false ;;
}
