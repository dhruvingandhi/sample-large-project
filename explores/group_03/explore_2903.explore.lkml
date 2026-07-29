# Explore: explore_2903
# Auto-generated LookML Explore File

include: "/views/domain_10/view_08710.view.lkml"
include: "/views/domain_12/view_08712.view.lkml"
include: "/views/domain_13/view_08713.view.lkml"
include: "/views/domain_14/view_08714.view.lkml"

explore: explore_2903 {
  label: "Explore Explore 2903"
  description: "Comprehensive analytics explore joining base view_08710 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08710
  
  always_filter: {
    filters: [view_08710.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08710.created_at_date: "7 days"]
    unless: [view_08710.id, view_08710.status]
  }

  join: view_08712 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08710.user_id} = ${view_08712.id} ;;
    required_joins: []
  }

  join: view_08713 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08710.account_id} = ${view_08713.account_id} ;;
    required_joins: [view_08712]
  }

  join: view_08714 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08710.category} = ${view_08714.category} ;;
  }

  access_filter: {
    field: view_08710.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08710.is_deleted} = false ;;
}
