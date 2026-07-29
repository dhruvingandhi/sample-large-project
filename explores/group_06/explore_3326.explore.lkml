# Explore: explore_3326
# Auto-generated LookML Explore File

include: "/views/domain_29/view_09979.view.lkml"
include: "/views/domain_31/view_09981.view.lkml"
include: "/views/domain_32/view_09982.view.lkml"
include: "/views/domain_33/view_09983.view.lkml"

explore: explore_3326 {
  label: "Explore Explore 3326"
  description: "Comprehensive analytics explore joining base view_09979 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_09979
  
  always_filter: {
    filters: [view_09979.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09979.created_at_date: "7 days"]
    unless: [view_09979.id, view_09979.status]
  }

  join: view_09981 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09979.user_id} = ${view_09981.id} ;;
    required_joins: []
  }

  join: view_09982 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09979.account_id} = ${view_09982.account_id} ;;
    required_joins: [view_09981]
  }

  join: view_09983 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09979.category} = ${view_09983.category} ;;
  }

  access_filter: {
    field: view_09979.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09979.is_deleted} = false ;;
}
