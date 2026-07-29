# Explore: explore_0506
# Auto-generated LookML Explore File

include: "/views/domain_19/view_01519.view.lkml"
include: "/views/domain_21/view_01521.view.lkml"
include: "/views/domain_22/view_01522.view.lkml"
include: "/views/domain_23/view_01523.view.lkml"

explore: explore_0506 {
  label: "Explore Explore 0506"
  description: "Comprehensive analytics explore joining base view_01519 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_01519
  
  always_filter: {
    filters: [view_01519.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01519.created_at_date: "7 days"]
    unless: [view_01519.id, view_01519.status]
  }

  join: view_01521 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01519.user_id} = ${view_01521.id} ;;
    required_joins: []
  }

  join: view_01522 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01519.account_id} = ${view_01522.account_id} ;;
    required_joins: [view_01521]
  }

  join: view_01523 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01519.category} = ${view_01523.category} ;;
  }

  access_filter: {
    field: view_01519.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01519.is_deleted} = false ;;
}
