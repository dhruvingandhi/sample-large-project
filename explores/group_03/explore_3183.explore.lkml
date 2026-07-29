# Explore: explore_3183
# Auto-generated LookML Explore File

include: "/views/domain_50/view_09550.view.lkml"
include: "/views/domain_02/view_09552.view.lkml"
include: "/views/domain_03/view_09553.view.lkml"
include: "/views/domain_04/view_09554.view.lkml"

explore: explore_3183 {
  label: "Explore Explore 3183"
  description: "Comprehensive analytics explore joining base view_09550 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_09550
  
  always_filter: {
    filters: [view_09550.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09550.created_at_date: "7 days"]
    unless: [view_09550.id, view_09550.status]
  }

  join: view_09552 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09550.user_id} = ${view_09552.id} ;;
    required_joins: []
  }

  join: view_09553 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09550.account_id} = ${view_09553.account_id} ;;
    required_joins: [view_09552]
  }

  join: view_09554 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09550.category} = ${view_09554.category} ;;
  }

  access_filter: {
    field: view_09550.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09550.is_deleted} = false ;;
}
