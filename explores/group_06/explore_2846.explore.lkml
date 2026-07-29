# Explore: explore_2846
# Auto-generated LookML Explore File

include: "/views/domain_39/view_08539.view.lkml"
include: "/views/domain_41/view_08541.view.lkml"
include: "/views/domain_42/view_08542.view.lkml"
include: "/views/domain_43/view_08543.view.lkml"

explore: explore_2846 {
  label: "Explore Explore 2846"
  description: "Comprehensive analytics explore joining base view_08539 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_08539
  
  always_filter: {
    filters: [view_08539.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08539.created_at_date: "7 days"]
    unless: [view_08539.id, view_08539.status]
  }

  join: view_08541 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08539.user_id} = ${view_08541.id} ;;
    required_joins: []
  }

  join: view_08542 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08539.account_id} = ${view_08542.account_id} ;;
    required_joins: [view_08541]
  }

  join: view_08543 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08539.category} = ${view_08543.category} ;;
  }

  access_filter: {
    field: view_08539.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08539.is_deleted} = false ;;
}
