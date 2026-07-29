# Explore: explore_2621
# Auto-generated LookML Explore File

include: "/views/domain_14/view_07864.view.lkml"
include: "/views/domain_16/view_07866.view.lkml"
include: "/views/domain_17/view_07867.view.lkml"
include: "/views/domain_18/view_07868.view.lkml"

explore: explore_2621 {
  label: "Explore Explore 2621"
  description: "Comprehensive analytics explore joining base view_07864 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07864
  
  always_filter: {
    filters: [view_07864.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07864.created_at_date: "7 days"]
    unless: [view_07864.id, view_07864.status]
  }

  join: view_07866 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07864.user_id} = ${view_07866.id} ;;
    required_joins: []
  }

  join: view_07867 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07864.account_id} = ${view_07867.account_id} ;;
    required_joins: [view_07866]
  }

  join: view_07868 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07864.category} = ${view_07868.category} ;;
  }

  access_filter: {
    field: view_07864.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07864.is_deleted} = false ;;
}
