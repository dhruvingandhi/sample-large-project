# Explore: explore_1485
# Auto-generated LookML Explore File

include: "/views/domain_06/view_04456.view.lkml"
include: "/views/domain_08/view_04458.view.lkml"
include: "/views/domain_09/view_04459.view.lkml"
include: "/views/domain_10/view_04460.view.lkml"

explore: explore_1485 {
  label: "Explore Explore 1485"
  description: "Comprehensive analytics explore joining base view_04456 with related tables."
  group_label: "Analytics Domain 06"
  
  view_name: view_04456
  
  always_filter: {
    filters: [view_04456.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04456.created_at_date: "7 days"]
    unless: [view_04456.id, view_04456.status]
  }

  join: view_04458 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04456.user_id} = ${view_04458.id} ;;
    required_joins: []
  }

  join: view_04459 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04456.account_id} = ${view_04459.account_id} ;;
    required_joins: [view_04458]
  }

  join: view_04460 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04456.category} = ${view_04460.category} ;;
  }

  access_filter: {
    field: view_04456.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04456.is_deleted} = false ;;
}
