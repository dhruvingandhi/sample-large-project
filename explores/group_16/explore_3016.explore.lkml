# Explore: explore_3016
# Auto-generated LookML Explore File

include: "/views/domain_49/view_09049.view.lkml"
include: "/views/domain_01/view_09051.view.lkml"
include: "/views/domain_02/view_09052.view.lkml"
include: "/views/domain_03/view_09053.view.lkml"

explore: explore_3016 {
  label: "Explore Explore 3016"
  description: "Comprehensive analytics explore joining base view_09049 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_09049
  
  always_filter: {
    filters: [view_09049.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09049.created_at_date: "7 days"]
    unless: [view_09049.id, view_09049.status]
  }

  join: view_09051 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09049.user_id} = ${view_09051.id} ;;
    required_joins: []
  }

  join: view_09052 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09049.account_id} = ${view_09052.account_id} ;;
    required_joins: [view_09051]
  }

  join: view_09053 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09049.category} = ${view_09053.category} ;;
  }

  access_filter: {
    field: view_09049.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09049.is_deleted} = false ;;
}
