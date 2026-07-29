# Explore: explore_3118
# Auto-generated LookML Explore File

include: "/views/domain_05/view_09355.view.lkml"
include: "/views/domain_07/view_09357.view.lkml"
include: "/views/domain_08/view_09358.view.lkml"
include: "/views/domain_09/view_09359.view.lkml"

explore: explore_3118 {
  label: "Explore Explore 3118"
  description: "Comprehensive analytics explore joining base view_09355 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_09355
  
  always_filter: {
    filters: [view_09355.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09355.created_at_date: "7 days"]
    unless: [view_09355.id, view_09355.status]
  }

  join: view_09357 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09355.user_id} = ${view_09357.id} ;;
    required_joins: []
  }

  join: view_09358 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09355.account_id} = ${view_09358.account_id} ;;
    required_joins: [view_09357]
  }

  join: view_09359 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09355.category} = ${view_09359.category} ;;
  }

  access_filter: {
    field: view_09355.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09355.is_deleted} = false ;;
}
