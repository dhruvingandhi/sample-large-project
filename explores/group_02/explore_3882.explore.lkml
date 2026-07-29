# Explore: explore_3882
# Auto-generated LookML Explore File

include: "/views/domain_47/view_11647.view.lkml"
include: "/views/domain_49/view_11649.view.lkml"
include: "/views/domain_50/view_11650.view.lkml"
include: "/views/domain_01/view_11651.view.lkml"

explore: explore_3882 {
  label: "Explore Explore 3882"
  description: "Comprehensive analytics explore joining base view_11647 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11647
  
  always_filter: {
    filters: [view_11647.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11647.created_at_date: "7 days"]
    unless: [view_11647.id, view_11647.status]
  }

  join: view_11649 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11647.user_id} = ${view_11649.id} ;;
    required_joins: []
  }

  join: view_11650 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11647.account_id} = ${view_11650.account_id} ;;
    required_joins: [view_11649]
  }

  join: view_11651 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11647.category} = ${view_11651.category} ;;
  }

  access_filter: {
    field: view_11647.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11647.is_deleted} = false ;;
}
