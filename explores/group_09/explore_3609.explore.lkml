# Explore: explore_3609
# Auto-generated LookML Explore File

include: "/views/domain_28/view_10828.view.lkml"
include: "/views/domain_30/view_10830.view.lkml"
include: "/views/domain_31/view_10831.view.lkml"
include: "/views/domain_32/view_10832.view.lkml"

explore: explore_3609 {
  label: "Explore Explore 3609"
  description: "Comprehensive analytics explore joining base view_10828 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10828
  
  always_filter: {
    filters: [view_10828.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10828.created_at_date: "7 days"]
    unless: [view_10828.id, view_10828.status]
  }

  join: view_10830 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10828.user_id} = ${view_10830.id} ;;
    required_joins: []
  }

  join: view_10831 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10828.account_id} = ${view_10831.account_id} ;;
    required_joins: [view_10830]
  }

  join: view_10832 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10828.category} = ${view_10832.category} ;;
  }

  access_filter: {
    field: view_10828.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10828.is_deleted} = false ;;
}
