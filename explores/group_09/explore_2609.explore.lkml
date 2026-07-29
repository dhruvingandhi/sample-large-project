# Explore: explore_2609
# Auto-generated LookML Explore File

include: "/views/domain_28/view_07828.view.lkml"
include: "/views/domain_30/view_07830.view.lkml"
include: "/views/domain_31/view_07831.view.lkml"
include: "/views/domain_32/view_07832.view.lkml"

explore: explore_2609 {
  label: "Explore Explore 2609"
  description: "Comprehensive analytics explore joining base view_07828 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07828
  
  always_filter: {
    filters: [view_07828.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07828.created_at_date: "7 days"]
    unless: [view_07828.id, view_07828.status]
  }

  join: view_07830 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07828.user_id} = ${view_07830.id} ;;
    required_joins: []
  }

  join: view_07831 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07828.account_id} = ${view_07831.account_id} ;;
    required_joins: [view_07830]
  }

  join: view_07832 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07828.category} = ${view_07832.category} ;;
  }

  access_filter: {
    field: view_07828.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07828.is_deleted} = false ;;
}
