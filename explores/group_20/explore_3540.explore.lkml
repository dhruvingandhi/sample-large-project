# Update for 2000 file diff target
# Explore: explore_3540
# Auto-generated LookML Explore File

include: "/views/domain_21/view_10621.view.lkml"
include: "/views/domain_23/view_10623.view.lkml"
include: "/views/domain_24/view_10624.view.lkml"
include: "/views/domain_25/view_10625.view.lkml"

explore: explore_3540 {
  label: "Explore Explore 3540"
  description: "Comprehensive analytics explore joining base view_10621 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_10621
  
  always_filter: {
    filters: [view_10621.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10621.created_at_date: "7 days"]
    unless: [view_10621.id, view_10621.status]
  }

  join: view_10623 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10621.user_id} = ${view_10623.id} ;;
    required_joins: []
  }

  join: view_10624 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10621.account_id} = ${view_10624.account_id} ;;
    required_joins: [view_10623]
  }

  join: view_10625 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10621.category} = ${view_10625.category} ;;
  }

  access_filter: {
    field: view_10621.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10621.is_deleted} = false ;;
}
