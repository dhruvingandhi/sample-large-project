# Explore: explore_0076
# Auto-generated LookML Explore File

include: "/views/domain_29/view_00229.view.lkml"
include: "/views/domain_31/view_00231.view.lkml"
include: "/views/domain_32/view_00232.view.lkml"
include: "/views/domain_33/view_00233.view.lkml"

explore: explore_0076 {
  label: "Explore Explore 0076"
  description: "Comprehensive analytics explore joining base view_00229 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_00229
  
  always_filter: {
    filters: [view_00229.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00229.created_at_date: "7 days"]
    unless: [view_00229.id, view_00229.status]
  }

  join: view_00231 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00229.user_id} = ${view_00231.id} ;;
    required_joins: []
  }

  join: view_00232 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00229.account_id} = ${view_00232.account_id} ;;
    required_joins: [view_00231]
  }

  join: view_00233 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00229.category} = ${view_00233.category} ;;
  }

  access_filter: {
    field: view_00229.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00229.is_deleted} = false ;;
}
