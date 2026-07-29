# Explore: explore_2266
# Auto-generated LookML Explore File

include: "/views/domain_49/view_06799.view.lkml"
include: "/views/domain_01/view_06801.view.lkml"
include: "/views/domain_02/view_06802.view.lkml"
include: "/views/domain_03/view_06803.view.lkml"

explore: explore_2266 {
  label: "Explore Explore 2266"
  description: "Comprehensive analytics explore joining base view_06799 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06799
  
  always_filter: {
    filters: [view_06799.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06799.created_at_date: "7 days"]
    unless: [view_06799.id, view_06799.status]
  }

  join: view_06801 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06799.user_id} = ${view_06801.id} ;;
    required_joins: []
  }

  join: view_06802 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06799.account_id} = ${view_06802.account_id} ;;
    required_joins: [view_06801]
  }

  join: view_06803 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06799.category} = ${view_06803.category} ;;
  }

  access_filter: {
    field: view_06799.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06799.is_deleted} = false ;;
}
