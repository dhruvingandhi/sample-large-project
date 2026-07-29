# Explore: explore_2243
# Auto-generated LookML Explore File

include: "/views/domain_30/view_06730.view.lkml"
include: "/views/domain_32/view_06732.view.lkml"
include: "/views/domain_33/view_06733.view.lkml"
include: "/views/domain_34/view_06734.view.lkml"

explore: explore_2243 {
  label: "Explore Explore 2243"
  description: "Comprehensive analytics explore joining base view_06730 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_06730
  
  always_filter: {
    filters: [view_06730.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06730.created_at_date: "7 days"]
    unless: [view_06730.id, view_06730.status]
  }

  join: view_06732 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06730.user_id} = ${view_06732.id} ;;
    required_joins: []
  }

  join: view_06733 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06730.account_id} = ${view_06733.account_id} ;;
    required_joins: [view_06732]
  }

  join: view_06734 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06730.category} = ${view_06734.category} ;;
  }

  access_filter: {
    field: view_06730.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06730.is_deleted} = false ;;
}
