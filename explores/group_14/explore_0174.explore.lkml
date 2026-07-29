# Explore: explore_0174
# Auto-generated LookML Explore File

include: "/views/domain_23/view_00523.view.lkml"
include: "/views/domain_25/view_00525.view.lkml"
include: "/views/domain_26/view_00526.view.lkml"
include: "/views/domain_27/view_00527.view.lkml"

explore: explore_0174 {
  label: "Explore Explore 0174"
  description: "Comprehensive analytics explore joining base view_00523 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_00523
  
  always_filter: {
    filters: [view_00523.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00523.created_at_date: "7 days"]
    unless: [view_00523.id, view_00523.status]
  }

  join: view_00525 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00523.user_id} = ${view_00525.id} ;;
    required_joins: []
  }

  join: view_00526 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00523.account_id} = ${view_00526.account_id} ;;
    required_joins: [view_00525]
  }

  join: view_00527 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00523.category} = ${view_00527.category} ;;
  }

  access_filter: {
    field: view_00523.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00523.is_deleted} = false ;;
}
