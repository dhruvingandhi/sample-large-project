# Explore: explore_2854
# Auto-generated LookML Explore File

include: "/views/domain_13/view_08563.view.lkml"
include: "/views/domain_15/view_08565.view.lkml"
include: "/views/domain_16/view_08566.view.lkml"
include: "/views/domain_17/view_08567.view.lkml"

explore: explore_2854 {
  label: "Explore Explore 2854"
  description: "Comprehensive analytics explore joining base view_08563 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_08563
  
  always_filter: {
    filters: [view_08563.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08563.created_at_date: "7 days"]
    unless: [view_08563.id, view_08563.status]
  }

  join: view_08565 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08563.user_id} = ${view_08565.id} ;;
    required_joins: []
  }

  join: view_08566 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08563.account_id} = ${view_08566.account_id} ;;
    required_joins: [view_08565]
  }

  join: view_08567 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08563.category} = ${view_08567.category} ;;
  }

  access_filter: {
    field: view_08563.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08563.is_deleted} = false ;;
}
