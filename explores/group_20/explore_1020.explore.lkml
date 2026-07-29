# Explore: explore_1020
# Auto-generated LookML Explore File

include: "/views/domain_11/view_03061.view.lkml"
include: "/views/domain_13/view_03063.view.lkml"
include: "/views/domain_14/view_03064.view.lkml"
include: "/views/domain_15/view_03065.view.lkml"

explore: explore_1020 {
  label: "Explore Explore 1020"
  description: "Comprehensive analytics explore joining base view_03061 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_03061
  
  always_filter: {
    filters: [view_03061.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03061.created_at_date: "7 days"]
    unless: [view_03061.id, view_03061.status]
  }

  join: view_03063 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03061.user_id} = ${view_03063.id} ;;
    required_joins: []
  }

  join: view_03064 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03061.account_id} = ${view_03064.account_id} ;;
    required_joins: [view_03063]
  }

  join: view_03065 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03061.category} = ${view_03065.category} ;;
  }

  access_filter: {
    field: view_03061.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03061.is_deleted} = false ;;
}
