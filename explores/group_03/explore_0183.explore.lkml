# Explore: explore_0183
# Auto-generated LookML Explore File

include: "/views/domain_50/view_00550.view.lkml"
include: "/views/domain_02/view_00552.view.lkml"
include: "/views/domain_03/view_00553.view.lkml"
include: "/views/domain_04/view_00554.view.lkml"

explore: explore_0183 {
  label: "Explore Explore 0183"
  description: "Comprehensive analytics explore joining base view_00550 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_00550
  
  always_filter: {
    filters: [view_00550.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00550.created_at_date: "7 days"]
    unless: [view_00550.id, view_00550.status]
  }

  join: view_00552 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00550.user_id} = ${view_00552.id} ;;
    required_joins: []
  }

  join: view_00553 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00550.account_id} = ${view_00553.account_id} ;;
    required_joins: [view_00552]
  }

  join: view_00554 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00550.category} = ${view_00554.category} ;;
  }

  access_filter: {
    field: view_00550.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00550.is_deleted} = false ;;
}
