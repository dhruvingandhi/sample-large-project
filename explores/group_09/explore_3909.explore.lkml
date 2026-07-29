# Explore: explore_3909
# Auto-generated LookML Explore File

include: "/views/domain_28/view_11728.view.lkml"
include: "/views/domain_30/view_11730.view.lkml"
include: "/views/domain_31/view_11731.view.lkml"
include: "/views/domain_32/view_11732.view.lkml"

explore: explore_3909 {
  label: "Explore Explore 3909"
  description: "Comprehensive analytics explore joining base view_11728 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11728
  
  always_filter: {
    filters: [view_11728.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11728.created_at_date: "7 days"]
    unless: [view_11728.id, view_11728.status]
  }

  join: view_11730 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11728.user_id} = ${view_11730.id} ;;
    required_joins: []
  }

  join: view_11731 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11728.account_id} = ${view_11731.account_id} ;;
    required_joins: [view_11730]
  }

  join: view_11732 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11728.category} = ${view_11732.category} ;;
  }

  access_filter: {
    field: view_11728.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11728.is_deleted} = false ;;
}
