# Explore: explore_2423
# Auto-generated LookML Explore File

include: "/views/domain_20/view_07270.view.lkml"
include: "/views/domain_22/view_07272.view.lkml"
include: "/views/domain_23/view_07273.view.lkml"
include: "/views/domain_24/view_07274.view.lkml"

explore: explore_2423 {
  label: "Explore Explore 2423"
  description: "Comprehensive analytics explore joining base view_07270 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_07270
  
  always_filter: {
    filters: [view_07270.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07270.created_at_date: "7 days"]
    unless: [view_07270.id, view_07270.status]
  }

  join: view_07272 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07270.user_id} = ${view_07272.id} ;;
    required_joins: []
  }

  join: view_07273 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07270.account_id} = ${view_07273.account_id} ;;
    required_joins: [view_07272]
  }

  join: view_07274 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07270.category} = ${view_07274.category} ;;
  }

  access_filter: {
    field: view_07270.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07270.is_deleted} = false ;;
}
