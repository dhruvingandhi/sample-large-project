# Explore: explore_1903
# Auto-generated LookML Explore File

include: "/views/domain_10/view_05710.view.lkml"
include: "/views/domain_12/view_05712.view.lkml"
include: "/views/domain_13/view_05713.view.lkml"
include: "/views/domain_14/view_05714.view.lkml"

explore: explore_1903 {
  label: "Explore Explore 1903"
  description: "Comprehensive analytics explore joining base view_05710 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05710
  
  always_filter: {
    filters: [view_05710.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05710.created_at_date: "7 days"]
    unless: [view_05710.id, view_05710.status]
  }

  join: view_05712 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05710.user_id} = ${view_05712.id} ;;
    required_joins: []
  }

  join: view_05713 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05710.account_id} = ${view_05713.account_id} ;;
    required_joins: [view_05712]
  }

  join: view_05714 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05710.category} = ${view_05714.category} ;;
  }

  access_filter: {
    field: view_05710.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05710.is_deleted} = false ;;
}
