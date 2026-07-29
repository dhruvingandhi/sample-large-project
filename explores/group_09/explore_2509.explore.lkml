# Explore: explore_2509
# Auto-generated LookML Explore File

include: "/views/domain_28/view_07528.view.lkml"
include: "/views/domain_30/view_07530.view.lkml"
include: "/views/domain_31/view_07531.view.lkml"
include: "/views/domain_32/view_07532.view.lkml"

explore: explore_2509 {
  label: "Explore Explore 2509"
  description: "Comprehensive analytics explore joining base view_07528 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07528
  
  always_filter: {
    filters: [view_07528.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07528.created_at_date: "7 days"]
    unless: [view_07528.id, view_07528.status]
  }

  join: view_07530 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07528.user_id} = ${view_07530.id} ;;
    required_joins: []
  }

  join: view_07531 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07528.account_id} = ${view_07531.account_id} ;;
    required_joins: [view_07530]
  }

  join: view_07532 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07528.category} = ${view_07532.category} ;;
  }

  access_filter: {
    field: view_07528.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07528.is_deleted} = false ;;
}
