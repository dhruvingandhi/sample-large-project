# Explore: explore_0113
# Auto-generated LookML Explore File

include: "/views/domain_40/view_00340.view.lkml"
include: "/views/domain_42/view_00342.view.lkml"
include: "/views/domain_43/view_00343.view.lkml"
include: "/views/domain_44/view_00344.view.lkml"

explore: explore_0113 {
  label: "Explore Explore 0113"
  description: "Comprehensive analytics explore joining base view_00340 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00340
  
  always_filter: {
    filters: [view_00340.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00340.created_at_date: "7 days"]
    unless: [view_00340.id, view_00340.status]
  }

  join: view_00342 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00340.user_id} = ${view_00342.id} ;;
    required_joins: []
  }

  join: view_00343 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00340.account_id} = ${view_00343.account_id} ;;
    required_joins: [view_00342]
  }

  join: view_00344 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00340.category} = ${view_00344.category} ;;
  }

  access_filter: {
    field: view_00340.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00340.is_deleted} = false ;;
}
