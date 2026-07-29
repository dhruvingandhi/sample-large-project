# Explore: explore_1054
# Auto-generated LookML Explore File

include: "/views/domain_13/view_03163.view.lkml"
include: "/views/domain_15/view_03165.view.lkml"
include: "/views/domain_16/view_03166.view.lkml"
include: "/views/domain_17/view_03167.view.lkml"

explore: explore_1054 {
  label: "Explore Explore 1054"
  description: "Comprehensive analytics explore joining base view_03163 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_03163
  
  always_filter: {
    filters: [view_03163.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03163.created_at_date: "7 days"]
    unless: [view_03163.id, view_03163.status]
  }

  join: view_03165 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03163.user_id} = ${view_03165.id} ;;
    required_joins: []
  }

  join: view_03166 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03163.account_id} = ${view_03166.account_id} ;;
    required_joins: [view_03165]
  }

  join: view_03167 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03163.category} = ${view_03167.category} ;;
  }

  access_filter: {
    field: view_03163.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03163.is_deleted} = false ;;
}
