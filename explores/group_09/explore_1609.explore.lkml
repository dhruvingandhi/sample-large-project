# Explore: explore_1609
# Auto-generated LookML Explore File

include: "/views/domain_28/view_04828.view.lkml"
include: "/views/domain_30/view_04830.view.lkml"
include: "/views/domain_31/view_04831.view.lkml"
include: "/views/domain_32/view_04832.view.lkml"

explore: explore_1609 {
  label: "Explore Explore 1609"
  description: "Comprehensive analytics explore joining base view_04828 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_04828
  
  always_filter: {
    filters: [view_04828.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04828.created_at_date: "7 days"]
    unless: [view_04828.id, view_04828.status]
  }

  join: view_04830 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04828.user_id} = ${view_04830.id} ;;
    required_joins: []
  }

  join: view_04831 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04828.account_id} = ${view_04831.account_id} ;;
    required_joins: [view_04830]
  }

  join: view_04832 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04828.category} = ${view_04832.category} ;;
  }

  access_filter: {
    field: view_04828.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04828.is_deleted} = false ;;
}
