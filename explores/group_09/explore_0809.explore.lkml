# Explore: explore_0809
# Auto-generated LookML Explore File

include: "/views/domain_28/view_02428.view.lkml"
include: "/views/domain_30/view_02430.view.lkml"
include: "/views/domain_31/view_02431.view.lkml"
include: "/views/domain_32/view_02432.view.lkml"

explore: explore_0809 {
  label: "Explore Explore 0809"
  description: "Comprehensive analytics explore joining base view_02428 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_02428
  
  always_filter: {
    filters: [view_02428.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02428.created_at_date: "7 days"]
    unless: [view_02428.id, view_02428.status]
  }

  join: view_02430 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02428.user_id} = ${view_02430.id} ;;
    required_joins: []
  }

  join: view_02431 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02428.account_id} = ${view_02431.account_id} ;;
    required_joins: [view_02430]
  }

  join: view_02432 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02428.category} = ${view_02432.category} ;;
  }

  access_filter: {
    field: view_02428.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02428.is_deleted} = false ;;
}
