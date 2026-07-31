# Update for 2000 file diff target
# Explore: explore_0300
# Auto-generated LookML Explore File

include: "/views/domain_01/view_00901.view.lkml"
include: "/views/domain_03/view_00903.view.lkml"
include: "/views/domain_04/view_00904.view.lkml"
include: "/views/domain_05/view_00905.view.lkml"

explore: explore_0300 {
  label: "Explore Explore 0300"
  description: "Comprehensive analytics explore joining base view_00901 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_00901
  
  always_filter: {
    filters: [view_00901.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00901.created_at_date: "7 days"]
    unless: [view_00901.id, view_00901.status]
  }

  join: view_00903 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00901.user_id} = ${view_00903.id} ;;
    required_joins: []
  }

  join: view_00904 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00901.account_id} = ${view_00904.account_id} ;;
    required_joins: [view_00903]
  }

  join: view_00905 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00901.category} = ${view_00905.category} ;;
  }

  access_filter: {
    field: view_00901.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00901.is_deleted} = false ;;
}
