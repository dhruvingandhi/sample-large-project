# Explore: explore_0019
# Auto-generated LookML Explore File

include: "/views/domain_08/view_00058.view.lkml"
include: "/views/domain_10/view_00060.view.lkml"
include: "/views/domain_11/view_00061.view.lkml"
include: "/views/domain_12/view_00062.view.lkml"

explore: explore_0019 {
  label: "Explore Explore 0019"
  description: "Comprehensive analytics explore joining base view_00058 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_00058
  
  always_filter: {
    filters: [view_00058.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00058.created_at_date: "7 days"]
    unless: [view_00058.id, view_00058.status]
  }

  join: view_00060 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00058.user_id} = ${view_00060.id} ;;
    required_joins: []
  }

  join: view_00061 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00058.account_id} = ${view_00061.account_id} ;;
    required_joins: [view_00060]
  }

  join: view_00062 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00058.category} = ${view_00062.category} ;;
  }

  access_filter: {
    field: view_00058.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00058.is_deleted} = false ;;
}
