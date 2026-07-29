# Explore: explore_0631
# Auto-generated LookML Explore File

include: "/views/domain_44/view_01894.view.lkml"
include: "/views/domain_46/view_01896.view.lkml"
include: "/views/domain_47/view_01897.view.lkml"
include: "/views/domain_48/view_01898.view.lkml"

explore: explore_0631 {
  label: "Explore Explore 0631"
  description: "Comprehensive analytics explore joining base view_01894 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_01894
  
  always_filter: {
    filters: [view_01894.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01894.created_at_date: "7 days"]
    unless: [view_01894.id, view_01894.status]
  }

  join: view_01896 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01894.user_id} = ${view_01896.id} ;;
    required_joins: []
  }

  join: view_01897 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01894.account_id} = ${view_01897.account_id} ;;
    required_joins: [view_01896]
  }

  join: view_01898 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01894.category} = ${view_01898.category} ;;
  }

  access_filter: {
    field: view_01894.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01894.is_deleted} = false ;;
}
