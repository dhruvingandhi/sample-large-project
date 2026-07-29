# Explore: explore_0049
# Auto-generated LookML Explore File

include: "/views/domain_48/view_00148.view.lkml"
include: "/views/domain_50/view_00150.view.lkml"
include: "/views/domain_01/view_00151.view.lkml"
include: "/views/domain_02/view_00152.view.lkml"

explore: explore_0049 {
  label: "Explore Explore 0049"
  description: "Comprehensive analytics explore joining base view_00148 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00148
  
  always_filter: {
    filters: [view_00148.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00148.created_at_date: "7 days"]
    unless: [view_00148.id, view_00148.status]
  }

  join: view_00150 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00148.user_id} = ${view_00150.id} ;;
    required_joins: []
  }

  join: view_00151 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00148.account_id} = ${view_00151.account_id} ;;
    required_joins: [view_00150]
  }

  join: view_00152 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00148.category} = ${view_00152.category} ;;
  }

  access_filter: {
    field: view_00148.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00148.is_deleted} = false ;;
}
