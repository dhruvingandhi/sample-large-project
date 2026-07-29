# Explore: explore_2600
# Auto-generated LookML Explore File

include: "/views/domain_01/view_07801.view.lkml"
include: "/views/domain_03/view_07803.view.lkml"
include: "/views/domain_04/view_07804.view.lkml"
include: "/views/domain_05/view_07805.view.lkml"

explore: explore_2600 {
  label: "Explore Explore 2600"
  description: "Comprehensive analytics explore joining base view_07801 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07801
  
  always_filter: {
    filters: [view_07801.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07801.created_at_date: "7 days"]
    unless: [view_07801.id, view_07801.status]
  }

  join: view_07803 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07801.user_id} = ${view_07803.id} ;;
    required_joins: []
  }

  join: view_07804 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07801.account_id} = ${view_07804.account_id} ;;
    required_joins: [view_07803]
  }

  join: view_07805 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07801.category} = ${view_07805.category} ;;
  }

  access_filter: {
    field: view_07801.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07801.is_deleted} = false ;;
}
