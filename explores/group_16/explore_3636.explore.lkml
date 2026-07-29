# Explore: explore_3636
# Auto-generated LookML Explore File

include: "/views/domain_09/view_10909.view.lkml"
include: "/views/domain_11/view_10911.view.lkml"
include: "/views/domain_12/view_10912.view.lkml"
include: "/views/domain_13/view_10913.view.lkml"

explore: explore_3636 {
  label: "Explore Explore 3636"
  description: "Comprehensive analytics explore joining base view_10909 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_10909
  
  always_filter: {
    filters: [view_10909.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10909.created_at_date: "7 days"]
    unless: [view_10909.id, view_10909.status]
  }

  join: view_10911 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10909.user_id} = ${view_10911.id} ;;
    required_joins: []
  }

  join: view_10912 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10909.account_id} = ${view_10912.account_id} ;;
    required_joins: [view_10911]
  }

  join: view_10913 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10909.category} = ${view_10913.category} ;;
  }

  access_filter: {
    field: view_10909.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10909.is_deleted} = false ;;
}
