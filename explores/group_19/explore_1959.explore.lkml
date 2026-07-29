# Explore: explore_1959
# Auto-generated LookML Explore File

include: "/views/domain_28/view_05878.view.lkml"
include: "/views/domain_30/view_05880.view.lkml"
include: "/views/domain_31/view_05881.view.lkml"
include: "/views/domain_32/view_05882.view.lkml"

explore: explore_1959 {
  label: "Explore Explore 1959"
  description: "Comprehensive analytics explore joining base view_05878 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_05878
  
  always_filter: {
    filters: [view_05878.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05878.created_at_date: "7 days"]
    unless: [view_05878.id, view_05878.status]
  }

  join: view_05880 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05878.user_id} = ${view_05880.id} ;;
    required_joins: []
  }

  join: view_05881 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05878.account_id} = ${view_05881.account_id} ;;
    required_joins: [view_05880]
  }

  join: view_05882 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05878.category} = ${view_05882.category} ;;
  }

  access_filter: {
    field: view_05878.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05878.is_deleted} = false ;;
}
