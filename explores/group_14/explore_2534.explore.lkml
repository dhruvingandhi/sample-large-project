# Explore: explore_2534
# Auto-generated LookML Explore File

include: "/views/domain_03/view_07603.view.lkml"
include: "/views/domain_05/view_07605.view.lkml"
include: "/views/domain_06/view_07606.view.lkml"
include: "/views/domain_07/view_07607.view.lkml"

explore: explore_2534 {
  label: "Explore Explore 2534"
  description: "Comprehensive analytics explore joining base view_07603 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07603
  
  always_filter: {
    filters: [view_07603.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07603.created_at_date: "7 days"]
    unless: [view_07603.id, view_07603.status]
  }

  join: view_07605 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07603.user_id} = ${view_07605.id} ;;
    required_joins: []
  }

  join: view_07606 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07603.account_id} = ${view_07606.account_id} ;;
    required_joins: [view_07605]
  }

  join: view_07607 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07603.category} = ${view_07607.category} ;;
  }

  access_filter: {
    field: view_07603.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07603.is_deleted} = false ;;
}
