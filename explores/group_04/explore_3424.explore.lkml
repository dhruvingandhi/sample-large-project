# Explore: explore_3424
# Auto-generated LookML Explore File

include: "/views/domain_23/view_10273.view.lkml"
include: "/views/domain_25/view_10275.view.lkml"
include: "/views/domain_26/view_10276.view.lkml"
include: "/views/domain_27/view_10277.view.lkml"

explore: explore_3424 {
  label: "Explore Explore 3424"
  description: "Comprehensive analytics explore joining base view_10273 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_10273
  
  always_filter: {
    filters: [view_10273.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10273.created_at_date: "7 days"]
    unless: [view_10273.id, view_10273.status]
  }

  join: view_10275 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10273.user_id} = ${view_10275.id} ;;
    required_joins: []
  }

  join: view_10276 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10273.account_id} = ${view_10276.account_id} ;;
    required_joins: [view_10275]
  }

  join: view_10277 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10273.category} = ${view_10277.category} ;;
  }

  access_filter: {
    field: view_10273.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10273.is_deleted} = false ;;
}
