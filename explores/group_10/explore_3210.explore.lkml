# Explore: explore_3210
# Auto-generated LookML Explore File

include: "/views/domain_31/view_09631.view.lkml"
include: "/views/domain_33/view_09633.view.lkml"
include: "/views/domain_34/view_09634.view.lkml"
include: "/views/domain_35/view_09635.view.lkml"

explore: explore_3210 {
  label: "Explore Explore 3210"
  description: "Comprehensive analytics explore joining base view_09631 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_09631
  
  always_filter: {
    filters: [view_09631.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09631.created_at_date: "7 days"]
    unless: [view_09631.id, view_09631.status]
  }

  join: view_09633 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09631.user_id} = ${view_09633.id} ;;
    required_joins: []
  }

  join: view_09634 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09631.account_id} = ${view_09634.account_id} ;;
    required_joins: [view_09633]
  }

  join: view_09635 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09631.category} = ${view_09635.category} ;;
  }

  access_filter: {
    field: view_09631.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09631.is_deleted} = false ;;
}
