# Explore: explore_0086
# Auto-generated LookML Explore File

include: "/views/domain_09/view_00259.view.lkml"
include: "/views/domain_11/view_00261.view.lkml"
include: "/views/domain_12/view_00262.view.lkml"
include: "/views/domain_13/view_00263.view.lkml"

explore: explore_0086 {
  label: "Explore Explore 0086"
  description: "Comprehensive analytics explore joining base view_00259 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00259
  
  always_filter: {
    filters: [view_00259.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00259.created_at_date: "7 days"]
    unless: [view_00259.id, view_00259.status]
  }

  join: view_00261 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00259.user_id} = ${view_00261.id} ;;
    required_joins: []
  }

  join: view_00262 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00259.account_id} = ${view_00262.account_id} ;;
    required_joins: [view_00261]
  }

  join: view_00263 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00259.category} = ${view_00263.category} ;;
  }

  access_filter: {
    field: view_00259.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00259.is_deleted} = false ;;
}
