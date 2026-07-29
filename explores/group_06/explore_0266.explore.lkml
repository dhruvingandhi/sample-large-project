# Explore: explore_0266
# Auto-generated LookML Explore File

include: "/views/domain_49/view_00799.view.lkml"
include: "/views/domain_01/view_00801.view.lkml"
include: "/views/domain_02/view_00802.view.lkml"
include: "/views/domain_03/view_00803.view.lkml"

explore: explore_0266 {
  label: "Explore Explore 0266"
  description: "Comprehensive analytics explore joining base view_00799 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_00799
  
  always_filter: {
    filters: [view_00799.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00799.created_at_date: "7 days"]
    unless: [view_00799.id, view_00799.status]
  }

  join: view_00801 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00799.user_id} = ${view_00801.id} ;;
    required_joins: []
  }

  join: view_00802 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00799.account_id} = ${view_00802.account_id} ;;
    required_joins: [view_00801]
  }

  join: view_00803 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00799.category} = ${view_00803.category} ;;
  }

  access_filter: {
    field: view_00799.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00799.is_deleted} = false ;;
}
