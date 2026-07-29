# Explore: explore_0349
# Auto-generated LookML Explore File

include: "/views/domain_48/view_01048.view.lkml"
include: "/views/domain_50/view_01050.view.lkml"
include: "/views/domain_01/view_01051.view.lkml"
include: "/views/domain_02/view_01052.view.lkml"

explore: explore_0349 {
  label: "Explore Explore 0349"
  description: "Comprehensive analytics explore joining base view_01048 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_01048
  
  always_filter: {
    filters: [view_01048.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01048.created_at_date: "7 days"]
    unless: [view_01048.id, view_01048.status]
  }

  join: view_01050 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01048.user_id} = ${view_01050.id} ;;
    required_joins: []
  }

  join: view_01051 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01048.account_id} = ${view_01051.account_id} ;;
    required_joins: [view_01050]
  }

  join: view_01052 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01048.category} = ${view_01052.category} ;;
  }

  access_filter: {
    field: view_01048.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01048.is_deleted} = false ;;
}
