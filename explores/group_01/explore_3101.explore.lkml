# Explore: explore_3101
# Auto-generated LookML Explore File

include: "/views/domain_04/view_09304.view.lkml"
include: "/views/domain_06/view_09306.view.lkml"
include: "/views/domain_07/view_09307.view.lkml"
include: "/views/domain_08/view_09308.view.lkml"

explore: explore_3101 {
  label: "Explore Explore 3101"
  description: "Comprehensive analytics explore joining base view_09304 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09304
  
  always_filter: {
    filters: [view_09304.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09304.created_at_date: "7 days"]
    unless: [view_09304.id, view_09304.status]
  }

  join: view_09306 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09304.user_id} = ${view_09306.id} ;;
    required_joins: []
  }

  join: view_09307 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09304.account_id} = ${view_09307.account_id} ;;
    required_joins: [view_09306]
  }

  join: view_09308 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09304.category} = ${view_09308.category} ;;
  }

  access_filter: {
    field: view_09304.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09304.is_deleted} = false ;;
}
