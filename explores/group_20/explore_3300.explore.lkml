# Update for 2000 file diff target
# Explore: explore_3300
# Auto-generated LookML Explore File

include: "/views/domain_01/view_09901.view.lkml"
include: "/views/domain_03/view_09903.view.lkml"
include: "/views/domain_04/view_09904.view.lkml"
include: "/views/domain_05/view_09905.view.lkml"

explore: explore_3300 {
  label: "Explore Explore 3300"
  description: "Comprehensive analytics explore joining base view_09901 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_09901
  
  always_filter: {
    filters: [view_09901.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09901.created_at_date: "7 days"]
    unless: [view_09901.id, view_09901.status]
  }

  join: view_09903 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09901.user_id} = ${view_09903.id} ;;
    required_joins: []
  }

  join: view_09904 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09901.account_id} = ${view_09904.account_id} ;;
    required_joins: [view_09903]
  }

  join: view_09905 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09901.category} = ${view_09905.category} ;;
  }

  access_filter: {
    field: view_09901.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09901.is_deleted} = false ;;
}
