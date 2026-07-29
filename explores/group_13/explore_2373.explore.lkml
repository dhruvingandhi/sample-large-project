# Explore: explore_2373
# Auto-generated LookML Explore File

include: "/views/domain_20/view_07120.view.lkml"
include: "/views/domain_22/view_07122.view.lkml"
include: "/views/domain_23/view_07123.view.lkml"
include: "/views/domain_24/view_07124.view.lkml"

explore: explore_2373 {
  label: "Explore Explore 2373"
  description: "Comprehensive analytics explore joining base view_07120 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07120
  
  always_filter: {
    filters: [view_07120.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07120.created_at_date: "7 days"]
    unless: [view_07120.id, view_07120.status]
  }

  join: view_07122 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07120.user_id} = ${view_07122.id} ;;
    required_joins: []
  }

  join: view_07123 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07120.account_id} = ${view_07123.account_id} ;;
    required_joins: [view_07122]
  }

  join: view_07124 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07120.category} = ${view_07124.category} ;;
  }

  access_filter: {
    field: view_07120.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07120.is_deleted} = false ;;
}
