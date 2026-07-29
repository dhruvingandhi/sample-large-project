# Explore: explore_0124
# Auto-generated LookML Explore File

include: "/views/domain_23/view_00373.view.lkml"
include: "/views/domain_25/view_00375.view.lkml"
include: "/views/domain_26/view_00376.view.lkml"
include: "/views/domain_27/view_00377.view.lkml"

explore: explore_0124 {
  label: "Explore Explore 0124"
  description: "Comprehensive analytics explore joining base view_00373 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_00373
  
  always_filter: {
    filters: [view_00373.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00373.created_at_date: "7 days"]
    unless: [view_00373.id, view_00373.status]
  }

  join: view_00375 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00373.user_id} = ${view_00375.id} ;;
    required_joins: []
  }

  join: view_00376 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00373.account_id} = ${view_00376.account_id} ;;
    required_joins: [view_00375]
  }

  join: view_00377 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00373.category} = ${view_00377.category} ;;
  }

  access_filter: {
    field: view_00373.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00373.is_deleted} = false ;;
}
