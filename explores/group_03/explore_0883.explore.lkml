# Explore: explore_0883
# Auto-generated LookML Explore File

include: "/views/domain_50/view_02650.view.lkml"
include: "/views/domain_02/view_02652.view.lkml"
include: "/views/domain_03/view_02653.view.lkml"
include: "/views/domain_04/view_02654.view.lkml"

explore: explore_0883 {
  label: "Explore Explore 0883"
  description: "Comprehensive analytics explore joining base view_02650 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_02650
  
  always_filter: {
    filters: [view_02650.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02650.created_at_date: "7 days"]
    unless: [view_02650.id, view_02650.status]
  }

  join: view_02652 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02650.user_id} = ${view_02652.id} ;;
    required_joins: []
  }

  join: view_02653 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02650.account_id} = ${view_02653.account_id} ;;
    required_joins: [view_02652]
  }

  join: view_02654 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02650.category} = ${view_02654.category} ;;
  }

  access_filter: {
    field: view_02650.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02650.is_deleted} = false ;;
}
