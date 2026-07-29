# Explore: explore_0066
# Auto-generated LookML Explore File

include: "/views/domain_49/view_00199.view.lkml"
include: "/views/domain_01/view_00201.view.lkml"
include: "/views/domain_02/view_00202.view.lkml"
include: "/views/domain_03/view_00203.view.lkml"

explore: explore_0066 {
  label: "Explore Explore 0066"
  description: "Comprehensive analytics explore joining base view_00199 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00199
  
  always_filter: {
    filters: [view_00199.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00199.created_at_date: "7 days"]
    unless: [view_00199.id, view_00199.status]
  }

  join: view_00201 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00199.user_id} = ${view_00201.id} ;;
    required_joins: []
  }

  join: view_00202 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00199.account_id} = ${view_00202.account_id} ;;
    required_joins: [view_00201]
  }

  join: view_00203 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00199.category} = ${view_00203.category} ;;
  }

  access_filter: {
    field: view_00199.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00199.is_deleted} = false ;;
}
