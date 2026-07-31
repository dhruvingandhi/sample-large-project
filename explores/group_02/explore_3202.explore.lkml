# Update for 500 file diff target
# Explore: explore_3202
# Auto-generated LookML Explore File

include: "/views/domain_07/view_09607.view.lkml"
include: "/views/domain_09/view_09609.view.lkml"
include: "/views/domain_10/view_09610.view.lkml"
include: "/views/domain_11/view_09611.view.lkml"

explore: explore_3202 {
  label: "Explore Explore 3202"
  description: "Comprehensive analytics explore joining base view_09607 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09607
  
  always_filter: {
    filters: [view_09607.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09607.created_at_date: "7 days"]
    unless: [view_09607.id, view_09607.status]
  }

  join: view_09609 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09607.user_id} = ${view_09609.id} ;;
    required_joins: []
  }

  join: view_09610 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09607.account_id} = ${view_09610.account_id} ;;
    required_joins: [view_09609]
  }

  join: view_09611 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09607.category} = ${view_09611.category} ;;
  }

  access_filter: {
    field: view_09607.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09607.is_deleted} = false ;;
}
