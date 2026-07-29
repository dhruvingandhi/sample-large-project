# Explore: explore_3143
# Auto-generated LookML Explore File

include: "/views/domain_30/view_09430.view.lkml"
include: "/views/domain_32/view_09432.view.lkml"
include: "/views/domain_33/view_09433.view.lkml"
include: "/views/domain_34/view_09434.view.lkml"

explore: explore_3143 {
  label: "Explore Explore 3143"
  description: "Comprehensive analytics explore joining base view_09430 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09430
  
  always_filter: {
    filters: [view_09430.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09430.created_at_date: "7 days"]
    unless: [view_09430.id, view_09430.status]
  }

  join: view_09432 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09430.user_id} = ${view_09432.id} ;;
    required_joins: []
  }

  join: view_09433 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09430.account_id} = ${view_09433.account_id} ;;
    required_joins: [view_09432]
  }

  join: view_09434 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09430.category} = ${view_09434.category} ;;
  }

  access_filter: {
    field: view_09430.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09430.is_deleted} = false ;;
}
