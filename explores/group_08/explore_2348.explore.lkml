# Explore: explore_2348
# Auto-generated LookML Explore File

include: "/views/domain_45/view_07045.view.lkml"
include: "/views/domain_47/view_07047.view.lkml"
include: "/views/domain_48/view_07048.view.lkml"
include: "/views/domain_49/view_07049.view.lkml"

explore: explore_2348 {
  label: "Explore Explore 2348"
  description: "Comprehensive analytics explore joining base view_07045 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07045
  
  always_filter: {
    filters: [view_07045.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07045.created_at_date: "7 days"]
    unless: [view_07045.id, view_07045.status]
  }

  join: view_07047 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07045.user_id} = ${view_07047.id} ;;
    required_joins: []
  }

  join: view_07048 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07045.account_id} = ${view_07048.account_id} ;;
    required_joins: [view_07047]
  }

  join: view_07049 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07045.category} = ${view_07049.category} ;;
  }

  access_filter: {
    field: view_07045.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07045.is_deleted} = false ;;
}
