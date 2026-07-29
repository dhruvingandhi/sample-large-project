# Explore: explore_2326
# Auto-generated LookML Explore File

include: "/views/domain_29/view_06979.view.lkml"
include: "/views/domain_31/view_06981.view.lkml"
include: "/views/domain_32/view_06982.view.lkml"
include: "/views/domain_33/view_06983.view.lkml"

explore: explore_2326 {
  label: "Explore Explore 2326"
  description: "Comprehensive analytics explore joining base view_06979 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06979
  
  always_filter: {
    filters: [view_06979.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06979.created_at_date: "7 days"]
    unless: [view_06979.id, view_06979.status]
  }

  join: view_06981 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06979.user_id} = ${view_06981.id} ;;
    required_joins: []
  }

  join: view_06982 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06979.account_id} = ${view_06982.account_id} ;;
    required_joins: [view_06981]
  }

  join: view_06983 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06979.category} = ${view_06983.category} ;;
  }

  access_filter: {
    field: view_06979.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06979.is_deleted} = false ;;
}
