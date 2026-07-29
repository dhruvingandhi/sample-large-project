# Explore: explore_1326
# Auto-generated LookML Explore File

include: "/views/domain_29/view_03979.view.lkml"
include: "/views/domain_31/view_03981.view.lkml"
include: "/views/domain_32/view_03982.view.lkml"
include: "/views/domain_33/view_03983.view.lkml"

explore: explore_1326 {
  label: "Explore Explore 1326"
  description: "Comprehensive analytics explore joining base view_03979 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03979
  
  always_filter: {
    filters: [view_03979.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03979.created_at_date: "7 days"]
    unless: [view_03979.id, view_03979.status]
  }

  join: view_03981 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03979.user_id} = ${view_03981.id} ;;
    required_joins: []
  }

  join: view_03982 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03979.account_id} = ${view_03982.account_id} ;;
    required_joins: [view_03981]
  }

  join: view_03983 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03979.category} = ${view_03983.category} ;;
  }

  access_filter: {
    field: view_03979.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03979.is_deleted} = false ;;
}
