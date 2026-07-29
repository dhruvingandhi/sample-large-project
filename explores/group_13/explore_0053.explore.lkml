# Explore: explore_0053
# Auto-generated LookML Explore File

include: "/views/domain_10/view_00160.view.lkml"
include: "/views/domain_12/view_00162.view.lkml"
include: "/views/domain_13/view_00163.view.lkml"
include: "/views/domain_14/view_00164.view.lkml"

explore: explore_0053 {
  label: "Explore Explore 0053"
  description: "Comprehensive analytics explore joining base view_00160 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00160
  
  always_filter: {
    filters: [view_00160.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00160.created_at_date: "7 days"]
    unless: [view_00160.id, view_00160.status]
  }

  join: view_00162 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00160.user_id} = ${view_00162.id} ;;
    required_joins: []
  }

  join: view_00163 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00160.account_id} = ${view_00163.account_id} ;;
    required_joins: [view_00162]
  }

  join: view_00164 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00160.category} = ${view_00164.category} ;;
  }

  access_filter: {
    field: view_00160.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00160.is_deleted} = false ;;
}
