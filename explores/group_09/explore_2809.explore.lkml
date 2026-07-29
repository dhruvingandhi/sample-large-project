# Explore: explore_2809
# Auto-generated LookML Explore File

include: "/views/domain_28/view_08428.view.lkml"
include: "/views/domain_30/view_08430.view.lkml"
include: "/views/domain_31/view_08431.view.lkml"
include: "/views/domain_32/view_08432.view.lkml"

explore: explore_2809 {
  label: "Explore Explore 2809"
  description: "Comprehensive analytics explore joining base view_08428 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_08428
  
  always_filter: {
    filters: [view_08428.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08428.created_at_date: "7 days"]
    unless: [view_08428.id, view_08428.status]
  }

  join: view_08430 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08428.user_id} = ${view_08430.id} ;;
    required_joins: []
  }

  join: view_08431 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08428.account_id} = ${view_08431.account_id} ;;
    required_joins: [view_08430]
  }

  join: view_08432 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08428.category} = ${view_08432.category} ;;
  }

  access_filter: {
    field: view_08428.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08428.is_deleted} = false ;;
}
