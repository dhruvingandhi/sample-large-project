# Explore: explore_1506
# Auto-generated LookML Explore File

include: "/views/domain_19/view_04519.view.lkml"
include: "/views/domain_21/view_04521.view.lkml"
include: "/views/domain_22/view_04522.view.lkml"
include: "/views/domain_23/view_04523.view.lkml"

explore: explore_1506 {
  label: "Explore Explore 1506"
  description: "Comprehensive analytics explore joining base view_04519 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04519
  
  always_filter: {
    filters: [view_04519.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04519.created_at_date: "7 days"]
    unless: [view_04519.id, view_04519.status]
  }

  join: view_04521 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04519.user_id} = ${view_04521.id} ;;
    required_joins: []
  }

  join: view_04522 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04519.account_id} = ${view_04522.account_id} ;;
    required_joins: [view_04521]
  }

  join: view_04523 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04519.category} = ${view_04523.category} ;;
  }

  access_filter: {
    field: view_04519.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04519.is_deleted} = false ;;
}
