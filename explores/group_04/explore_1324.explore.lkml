# Explore: explore_1324
# Auto-generated LookML Explore File

include: "/views/domain_23/view_03973.view.lkml"
include: "/views/domain_25/view_03975.view.lkml"
include: "/views/domain_26/view_03976.view.lkml"
include: "/views/domain_27/view_03977.view.lkml"

explore: explore_1324 {
  label: "Explore Explore 1324"
  description: "Comprehensive analytics explore joining base view_03973 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_03973
  
  always_filter: {
    filters: [view_03973.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03973.created_at_date: "7 days"]
    unless: [view_03973.id, view_03973.status]
  }

  join: view_03975 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03973.user_id} = ${view_03975.id} ;;
    required_joins: []
  }

  join: view_03976 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03973.account_id} = ${view_03976.account_id} ;;
    required_joins: [view_03975]
  }

  join: view_03977 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03973.category} = ${view_03977.category} ;;
  }

  access_filter: {
    field: view_03973.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03973.is_deleted} = false ;;
}
