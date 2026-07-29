# Explore: explore_2210
# Auto-generated LookML Explore File

include: "/views/domain_31/view_06631.view.lkml"
include: "/views/domain_33/view_06633.view.lkml"
include: "/views/domain_34/view_06634.view.lkml"
include: "/views/domain_35/view_06635.view.lkml"

explore: explore_2210 {
  label: "Explore Explore 2210"
  description: "Comprehensive analytics explore joining base view_06631 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06631
  
  always_filter: {
    filters: [view_06631.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06631.created_at_date: "7 days"]
    unless: [view_06631.id, view_06631.status]
  }

  join: view_06633 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06631.user_id} = ${view_06633.id} ;;
    required_joins: []
  }

  join: view_06634 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06631.account_id} = ${view_06634.account_id} ;;
    required_joins: [view_06633]
  }

  join: view_06635 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06631.category} = ${view_06635.category} ;;
  }

  access_filter: {
    field: view_06631.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06631.is_deleted} = false ;;
}
