# Update for 500 file diff target
# Explore: explore_0882
# Auto-generated LookML Explore File

include: "/views/domain_47/view_02647.view.lkml"
include: "/views/domain_49/view_02649.view.lkml"
include: "/views/domain_50/view_02650.view.lkml"
include: "/views/domain_01/view_02651.view.lkml"

explore: explore_0882 {
  label: "Explore Explore 0882"
  description: "Comprehensive analytics explore joining base view_02647 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_02647
  
  always_filter: {
    filters: [view_02647.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02647.created_at_date: "7 days"]
    unless: [view_02647.id, view_02647.status]
  }

  join: view_02649 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02647.user_id} = ${view_02649.id} ;;
    required_joins: []
  }

  join: view_02650 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02647.account_id} = ${view_02650.account_id} ;;
    required_joins: [view_02649]
  }

  join: view_02651 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02647.category} = ${view_02651.category} ;;
  }

  access_filter: {
    field: view_02647.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02647.is_deleted} = false ;;
}
