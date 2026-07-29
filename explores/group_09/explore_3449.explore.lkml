# Explore: explore_3449
# Auto-generated LookML Explore File

include: "/views/domain_48/view_10348.view.lkml"
include: "/views/domain_50/view_10350.view.lkml"
include: "/views/domain_01/view_10351.view.lkml"
include: "/views/domain_02/view_10352.view.lkml"

explore: explore_3449 {
  label: "Explore Explore 3449"
  description: "Comprehensive analytics explore joining base view_10348 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_10348
  
  always_filter: {
    filters: [view_10348.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10348.created_at_date: "7 days"]
    unless: [view_10348.id, view_10348.status]
  }

  join: view_10350 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10348.user_id} = ${view_10350.id} ;;
    required_joins: []
  }

  join: view_10351 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10348.account_id} = ${view_10351.account_id} ;;
    required_joins: [view_10350]
  }

  join: view_10352 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10348.category} = ${view_10352.category} ;;
  }

  access_filter: {
    field: view_10348.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10348.is_deleted} = false ;;
}
