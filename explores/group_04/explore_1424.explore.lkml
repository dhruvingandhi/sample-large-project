# Explore: explore_1424
# Auto-generated LookML Explore File

include: "/views/domain_23/view_04273.view.lkml"
include: "/views/domain_25/view_04275.view.lkml"
include: "/views/domain_26/view_04276.view.lkml"
include: "/views/domain_27/view_04277.view.lkml"

explore: explore_1424 {
  label: "Explore Explore 1424"
  description: "Comprehensive analytics explore joining base view_04273 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_04273
  
  always_filter: {
    filters: [view_04273.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04273.created_at_date: "7 days"]
    unless: [view_04273.id, view_04273.status]
  }

  join: view_04275 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04273.user_id} = ${view_04275.id} ;;
    required_joins: []
  }

  join: view_04276 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04273.account_id} = ${view_04276.account_id} ;;
    required_joins: [view_04275]
  }

  join: view_04277 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04273.category} = ${view_04277.category} ;;
  }

  access_filter: {
    field: view_04273.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04273.is_deleted} = false ;;
}
