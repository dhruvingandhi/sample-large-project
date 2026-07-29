# Explore: explore_0143
# Auto-generated LookML Explore File

include: "/views/domain_30/view_00430.view.lkml"
include: "/views/domain_32/view_00432.view.lkml"
include: "/views/domain_33/view_00433.view.lkml"
include: "/views/domain_34/view_00434.view.lkml"

explore: explore_0143 {
  label: "Explore Explore 0143"
  description: "Comprehensive analytics explore joining base view_00430 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00430
  
  always_filter: {
    filters: [view_00430.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00430.created_at_date: "7 days"]
    unless: [view_00430.id, view_00430.status]
  }

  join: view_00432 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00430.user_id} = ${view_00432.id} ;;
    required_joins: []
  }

  join: view_00433 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00430.account_id} = ${view_00433.account_id} ;;
    required_joins: [view_00432]
  }

  join: view_00434 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00430.category} = ${view_00434.category} ;;
  }

  access_filter: {
    field: view_00430.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00430.is_deleted} = false ;;
}
