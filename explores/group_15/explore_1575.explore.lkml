# Explore: explore_1575
# Auto-generated LookML Explore File

include: "/views/domain_26/view_04726.view.lkml"
include: "/views/domain_28/view_04728.view.lkml"
include: "/views/domain_29/view_04729.view.lkml"
include: "/views/domain_30/view_04730.view.lkml"

explore: explore_1575 {
  label: "Explore Explore 1575"
  description: "Comprehensive analytics explore joining base view_04726 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04726
  
  always_filter: {
    filters: [view_04726.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04726.created_at_date: "7 days"]
    unless: [view_04726.id, view_04726.status]
  }

  join: view_04728 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04726.user_id} = ${view_04728.id} ;;
    required_joins: []
  }

  join: view_04729 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04726.account_id} = ${view_04729.account_id} ;;
    required_joins: [view_04728]
  }

  join: view_04730 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04726.category} = ${view_04730.category} ;;
  }

  access_filter: {
    field: view_04726.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04726.is_deleted} = false ;;
}
