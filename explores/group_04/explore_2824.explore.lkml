# Explore: explore_2824
# Auto-generated LookML Explore File

include: "/views/domain_23/view_08473.view.lkml"
include: "/views/domain_25/view_08475.view.lkml"
include: "/views/domain_26/view_08476.view.lkml"
include: "/views/domain_27/view_08477.view.lkml"

explore: explore_2824 {
  label: "Explore Explore 2824"
  description: "Comprehensive analytics explore joining base view_08473 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_08473
  
  always_filter: {
    filters: [view_08473.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08473.created_at_date: "7 days"]
    unless: [view_08473.id, view_08473.status]
  }

  join: view_08475 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08473.user_id} = ${view_08475.id} ;;
    required_joins: []
  }

  join: view_08476 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08473.account_id} = ${view_08476.account_id} ;;
    required_joins: [view_08475]
  }

  join: view_08477 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08473.category} = ${view_08477.category} ;;
  }

  access_filter: {
    field: view_08473.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08473.is_deleted} = false ;;
}
