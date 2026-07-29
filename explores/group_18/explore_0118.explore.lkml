# Explore: explore_0118
# Auto-generated LookML Explore File

include: "/views/domain_05/view_00355.view.lkml"
include: "/views/domain_07/view_00357.view.lkml"
include: "/views/domain_08/view_00358.view.lkml"
include: "/views/domain_09/view_00359.view.lkml"

explore: explore_0118 {
  label: "Explore Explore 0118"
  description: "Comprehensive analytics explore joining base view_00355 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_00355
  
  always_filter: {
    filters: [view_00355.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00355.created_at_date: "7 days"]
    unless: [view_00355.id, view_00355.status]
  }

  join: view_00357 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00355.user_id} = ${view_00357.id} ;;
    required_joins: []
  }

  join: view_00358 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00355.account_id} = ${view_00358.account_id} ;;
    required_joins: [view_00357]
  }

  join: view_00359 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00355.category} = ${view_00359.category} ;;
  }

  access_filter: {
    field: view_00355.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00355.is_deleted} = false ;;
}
