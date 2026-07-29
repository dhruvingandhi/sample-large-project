# Explore: explore_0326
# Auto-generated LookML Explore File

include: "/views/domain_29/view_00979.view.lkml"
include: "/views/domain_31/view_00981.view.lkml"
include: "/views/domain_32/view_00982.view.lkml"
include: "/views/domain_33/view_00983.view.lkml"

explore: explore_0326 {
  label: "Explore Explore 0326"
  description: "Comprehensive analytics explore joining base view_00979 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00979
  
  always_filter: {
    filters: [view_00979.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00979.created_at_date: "7 days"]
    unless: [view_00979.id, view_00979.status]
  }

  join: view_00981 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00979.user_id} = ${view_00981.id} ;;
    required_joins: []
  }

  join: view_00982 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00979.account_id} = ${view_00982.account_id} ;;
    required_joins: [view_00981]
  }

  join: view_00983 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00979.category} = ${view_00983.category} ;;
  }

  access_filter: {
    field: view_00979.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00979.is_deleted} = false ;;
}
