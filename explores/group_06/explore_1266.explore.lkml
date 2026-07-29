# Explore: explore_1266
# Auto-generated LookML Explore File

include: "/views/domain_49/view_03799.view.lkml"
include: "/views/domain_01/view_03801.view.lkml"
include: "/views/domain_02/view_03802.view.lkml"
include: "/views/domain_03/view_03803.view.lkml"

explore: explore_1266 {
  label: "Explore Explore 1266"
  description: "Comprehensive analytics explore joining base view_03799 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03799
  
  always_filter: {
    filters: [view_03799.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03799.created_at_date: "7 days"]
    unless: [view_03799.id, view_03799.status]
  }

  join: view_03801 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03799.user_id} = ${view_03801.id} ;;
    required_joins: []
  }

  join: view_03802 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03799.account_id} = ${view_03802.account_id} ;;
    required_joins: [view_03801]
  }

  join: view_03803 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03799.category} = ${view_03803.category} ;;
  }

  access_filter: {
    field: view_03799.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03799.is_deleted} = false ;;
}
