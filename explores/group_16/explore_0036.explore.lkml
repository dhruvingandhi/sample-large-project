# Explore: explore_0036
# Auto-generated LookML Explore File

include: "/views/domain_09/view_00109.view.lkml"
include: "/views/domain_11/view_00111.view.lkml"
include: "/views/domain_12/view_00112.view.lkml"
include: "/views/domain_13/view_00113.view.lkml"

explore: explore_0036 {
  label: "Explore Explore 0036"
  description: "Comprehensive analytics explore joining base view_00109 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00109
  
  always_filter: {
    filters: [view_00109.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00109.created_at_date: "7 days"]
    unless: [view_00109.id, view_00109.status]
  }

  join: view_00111 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00109.user_id} = ${view_00111.id} ;;
    required_joins: []
  }

  join: view_00112 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00109.account_id} = ${view_00112.account_id} ;;
    required_joins: [view_00111]
  }

  join: view_00113 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00109.category} = ${view_00113.category} ;;
  }

  access_filter: {
    field: view_00109.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00109.is_deleted} = false ;;
}
