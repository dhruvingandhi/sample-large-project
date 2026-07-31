# Update for 2000 file diff target
# Explore: explore_1300
# Auto-generated LookML Explore File

include: "/views/domain_01/view_03901.view.lkml"
include: "/views/domain_03/view_03903.view.lkml"
include: "/views/domain_04/view_03904.view.lkml"
include: "/views/domain_05/view_03905.view.lkml"

explore: explore_1300 {
  label: "Explore Explore 1300"
  description: "Comprehensive analytics explore joining base view_03901 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03901
  
  always_filter: {
    filters: [view_03901.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03901.created_at_date: "7 days"]
    unless: [view_03901.id, view_03901.status]
  }

  join: view_03903 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03901.user_id} = ${view_03903.id} ;;
    required_joins: []
  }

  join: view_03904 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03901.account_id} = ${view_03904.account_id} ;;
    required_joins: [view_03903]
  }

  join: view_03905 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03901.category} = ${view_03905.category} ;;
  }

  access_filter: {
    field: view_03901.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03901.is_deleted} = false ;;
}
