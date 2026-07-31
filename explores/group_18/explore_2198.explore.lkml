# Update for 2000 file diff target
# Explore: explore_2198
# Auto-generated LookML Explore File

include: "/views/domain_45/view_06595.view.lkml"
include: "/views/domain_47/view_06597.view.lkml"
include: "/views/domain_48/view_06598.view.lkml"
include: "/views/domain_49/view_06599.view.lkml"

explore: explore_2198 {
  label: "Explore Explore 2198"
  description: "Comprehensive analytics explore joining base view_06595 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_06595
  
  always_filter: {
    filters: [view_06595.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06595.created_at_date: "7 days"]
    unless: [view_06595.id, view_06595.status]
  }

  join: view_06597 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06595.user_id} = ${view_06597.id} ;;
    required_joins: []
  }

  join: view_06598 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06595.account_id} = ${view_06598.account_id} ;;
    required_joins: [view_06597]
  }

  join: view_06599 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06595.category} = ${view_06599.category} ;;
  }

  access_filter: {
    field: view_06595.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06595.is_deleted} = false ;;
}
