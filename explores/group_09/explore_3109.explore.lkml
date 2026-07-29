# Explore: explore_3109
# Auto-generated LookML Explore File

include: "/views/domain_28/view_09328.view.lkml"
include: "/views/domain_30/view_09330.view.lkml"
include: "/views/domain_31/view_09331.view.lkml"
include: "/views/domain_32/view_09332.view.lkml"

explore: explore_3109 {
  label: "Explore Explore 3109"
  description: "Comprehensive analytics explore joining base view_09328 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09328
  
  always_filter: {
    filters: [view_09328.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09328.created_at_date: "7 days"]
    unless: [view_09328.id, view_09328.status]
  }

  join: view_09330 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09328.user_id} = ${view_09330.id} ;;
    required_joins: []
  }

  join: view_09331 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09328.account_id} = ${view_09331.account_id} ;;
    required_joins: [view_09330]
  }

  join: view_09332 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09328.category} = ${view_09332.category} ;;
  }

  access_filter: {
    field: view_09328.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09328.is_deleted} = false ;;
}
