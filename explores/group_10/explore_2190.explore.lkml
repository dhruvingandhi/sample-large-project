# Explore: explore_2190
# Auto-generated LookML Explore File

include: "/views/domain_21/view_06571.view.lkml"
include: "/views/domain_23/view_06573.view.lkml"
include: "/views/domain_24/view_06574.view.lkml"
include: "/views/domain_25/view_06575.view.lkml"

explore: explore_2190 {
  label: "Explore Explore 2190"
  description: "Comprehensive analytics explore joining base view_06571 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_06571
  
  always_filter: {
    filters: [view_06571.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06571.created_at_date: "7 days"]
    unless: [view_06571.id, view_06571.status]
  }

  join: view_06573 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06571.user_id} = ${view_06573.id} ;;
    required_joins: []
  }

  join: view_06574 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06571.account_id} = ${view_06574.account_id} ;;
    required_joins: [view_06573]
  }

  join: view_06575 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06571.category} = ${view_06575.category} ;;
  }

  access_filter: {
    field: view_06571.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06571.is_deleted} = false ;;
}
