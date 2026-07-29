# Explore: explore_3534
# Auto-generated LookML Explore File

include: "/views/domain_03/view_10603.view.lkml"
include: "/views/domain_05/view_10605.view.lkml"
include: "/views/domain_06/view_10606.view.lkml"
include: "/views/domain_07/view_10607.view.lkml"

explore: explore_3534 {
  label: "Explore Explore 3534"
  description: "Comprehensive analytics explore joining base view_10603 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10603
  
  always_filter: {
    filters: [view_10603.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10603.created_at_date: "7 days"]
    unless: [view_10603.id, view_10603.status]
  }

  join: view_10605 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10603.user_id} = ${view_10605.id} ;;
    required_joins: []
  }

  join: view_10606 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10603.account_id} = ${view_10606.account_id} ;;
    required_joins: [view_10605]
  }

  join: view_10607 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10603.category} = ${view_10607.category} ;;
  }

  access_filter: {
    field: view_10603.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10603.is_deleted} = false ;;
}
