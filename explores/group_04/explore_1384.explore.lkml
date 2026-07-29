# Explore: explore_1384
# Auto-generated LookML Explore File

include: "/views/domain_03/view_04153.view.lkml"
include: "/views/domain_05/view_04155.view.lkml"
include: "/views/domain_06/view_04156.view.lkml"
include: "/views/domain_07/view_04157.view.lkml"

explore: explore_1384 {
  label: "Explore Explore 1384"
  description: "Comprehensive analytics explore joining base view_04153 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04153
  
  always_filter: {
    filters: [view_04153.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04153.created_at_date: "7 days"]
    unless: [view_04153.id, view_04153.status]
  }

  join: view_04155 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04153.user_id} = ${view_04155.id} ;;
    required_joins: []
  }

  join: view_04156 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04153.account_id} = ${view_04156.account_id} ;;
    required_joins: [view_04155]
  }

  join: view_04157 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04153.category} = ${view_04157.category} ;;
  }

  access_filter: {
    field: view_04153.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04153.is_deleted} = false ;;
}
