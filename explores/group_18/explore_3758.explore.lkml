# Update for 2000 file diff target
# Explore: explore_3758
# Auto-generated LookML Explore File

include: "/views/domain_25/view_11275.view.lkml"
include: "/views/domain_27/view_11277.view.lkml"
include: "/views/domain_28/view_11278.view.lkml"
include: "/views/domain_29/view_11279.view.lkml"

explore: explore_3758 {
  label: "Explore Explore 3758"
  description: "Comprehensive analytics explore joining base view_11275 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_11275
  
  always_filter: {
    filters: [view_11275.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11275.created_at_date: "7 days"]
    unless: [view_11275.id, view_11275.status]
  }

  join: view_11277 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11275.user_id} = ${view_11277.id} ;;
    required_joins: []
  }

  join: view_11278 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11275.account_id} = ${view_11278.account_id} ;;
    required_joins: [view_11277]
  }

  join: view_11279 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11275.category} = ${view_11279.category} ;;
  }

  access_filter: {
    field: view_11275.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11275.is_deleted} = false ;;
}
