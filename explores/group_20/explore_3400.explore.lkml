# Update for 2000 file diff target
# Explore: explore_3400
# Auto-generated LookML Explore File

include: "/views/domain_01/view_10201.view.lkml"
include: "/views/domain_03/view_10203.view.lkml"
include: "/views/domain_04/view_10204.view.lkml"
include: "/views/domain_05/view_10205.view.lkml"

explore: explore_3400 {
  label: "Explore Explore 3400"
  description: "Comprehensive analytics explore joining base view_10201 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10201
  
  always_filter: {
    filters: [view_10201.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10201.created_at_date: "7 days"]
    unless: [view_10201.id, view_10201.status]
  }

  join: view_10203 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10201.user_id} = ${view_10203.id} ;;
    required_joins: []
  }

  join: view_10204 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10201.account_id} = ${view_10204.account_id} ;;
    required_joins: [view_10203]
  }

  join: view_10205 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10201.category} = ${view_10205.category} ;;
  }

  access_filter: {
    field: view_10201.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10201.is_deleted} = false ;;
}
