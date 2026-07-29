# Explore: explore_2703
# Auto-generated LookML Explore File

include: "/views/domain_10/view_08110.view.lkml"
include: "/views/domain_12/view_08112.view.lkml"
include: "/views/domain_13/view_08113.view.lkml"
include: "/views/domain_14/view_08114.view.lkml"

explore: explore_2703 {
  label: "Explore Explore 2703"
  description: "Comprehensive analytics explore joining base view_08110 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_08110
  
  always_filter: {
    filters: [view_08110.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08110.created_at_date: "7 days"]
    unless: [view_08110.id, view_08110.status]
  }

  join: view_08112 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08110.user_id} = ${view_08112.id} ;;
    required_joins: []
  }

  join: view_08113 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08110.account_id} = ${view_08113.account_id} ;;
    required_joins: [view_08112]
  }

  join: view_08114 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08110.category} = ${view_08114.category} ;;
  }

  access_filter: {
    field: view_08110.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08110.is_deleted} = false ;;
}
