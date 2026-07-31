# Update for 2000 file diff target
# Explore: explore_3390
# Auto-generated LookML Explore File

include: "/views/domain_21/view_10171.view.lkml"
include: "/views/domain_23/view_10173.view.lkml"
include: "/views/domain_24/view_10174.view.lkml"
include: "/views/domain_25/view_10175.view.lkml"

explore: explore_3390 {
  label: "Explore Explore 3390"
  description: "Comprehensive analytics explore joining base view_10171 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_10171
  
  always_filter: {
    filters: [view_10171.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10171.created_at_date: "7 days"]
    unless: [view_10171.id, view_10171.status]
  }

  join: view_10173 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10171.user_id} = ${view_10173.id} ;;
    required_joins: []
  }

  join: view_10174 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10171.account_id} = ${view_10174.account_id} ;;
    required_joins: [view_10173]
  }

  join: view_10175 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10171.category} = ${view_10175.category} ;;
  }

  access_filter: {
    field: view_10171.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10171.is_deleted} = false ;;
}
