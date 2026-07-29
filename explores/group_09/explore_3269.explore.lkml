# Explore: explore_3269
# Auto-generated LookML Explore File

include: "/views/domain_08/view_09808.view.lkml"
include: "/views/domain_10/view_09810.view.lkml"
include: "/views/domain_11/view_09811.view.lkml"
include: "/views/domain_12/view_09812.view.lkml"

explore: explore_3269 {
  label: "Explore Explore 3269"
  description: "Comprehensive analytics explore joining base view_09808 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_09808
  
  always_filter: {
    filters: [view_09808.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09808.created_at_date: "7 days"]
    unless: [view_09808.id, view_09808.status]
  }

  join: view_09810 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09808.user_id} = ${view_09810.id} ;;
    required_joins: []
  }

  join: view_09811 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09808.account_id} = ${view_09811.account_id} ;;
    required_joins: [view_09810]
  }

  join: view_09812 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09808.category} = ${view_09812.category} ;;
  }

  access_filter: {
    field: view_09808.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09808.is_deleted} = false ;;
}
