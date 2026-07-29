# Explore: explore_2424
# Auto-generated LookML Explore File

include: "/views/domain_23/view_07273.view.lkml"
include: "/views/domain_25/view_07275.view.lkml"
include: "/views/domain_26/view_07276.view.lkml"
include: "/views/domain_27/view_07277.view.lkml"

explore: explore_2424 {
  label: "Explore Explore 2424"
  description: "Comprehensive analytics explore joining base view_07273 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_07273
  
  always_filter: {
    filters: [view_07273.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07273.created_at_date: "7 days"]
    unless: [view_07273.id, view_07273.status]
  }

  join: view_07275 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07273.user_id} = ${view_07275.id} ;;
    required_joins: []
  }

  join: view_07276 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07273.account_id} = ${view_07276.account_id} ;;
    required_joins: [view_07275]
  }

  join: view_07277 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07273.category} = ${view_07277.category} ;;
  }

  access_filter: {
    field: view_07273.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07273.is_deleted} = false ;;
}
