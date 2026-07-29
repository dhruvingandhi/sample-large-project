# Explore: explore_0016
# Auto-generated LookML Explore File

include: "/views/domain_49/view_00049.view.lkml"
include: "/views/domain_01/view_00051.view.lkml"
include: "/views/domain_02/view_00052.view.lkml"
include: "/views/domain_03/view_00053.view.lkml"

explore: explore_0016 {
  label: "Explore Explore 0016"
  description: "Comprehensive analytics explore joining base view_00049 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00049
  
  always_filter: {
    filters: [view_00049.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00049.created_at_date: "7 days"]
    unless: [view_00049.id, view_00049.status]
  }

  join: view_00051 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00049.user_id} = ${view_00051.id} ;;
    required_joins: []
  }

  join: view_00052 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00049.account_id} = ${view_00052.account_id} ;;
    required_joins: [view_00051]
  }

  join: view_00053 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00049.category} = ${view_00053.category} ;;
  }

  access_filter: {
    field: view_00049.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00049.is_deleted} = false ;;
}
