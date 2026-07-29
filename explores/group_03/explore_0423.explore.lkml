# Explore: explore_0423
# Auto-generated LookML Explore File

include: "/views/domain_20/view_01270.view.lkml"
include: "/views/domain_22/view_01272.view.lkml"
include: "/views/domain_23/view_01273.view.lkml"
include: "/views/domain_24/view_01274.view.lkml"

explore: explore_0423 {
  label: "Explore Explore 0423"
  description: "Comprehensive analytics explore joining base view_01270 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_01270
  
  always_filter: {
    filters: [view_01270.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01270.created_at_date: "7 days"]
    unless: [view_01270.id, view_01270.status]
  }

  join: view_01272 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01270.user_id} = ${view_01272.id} ;;
    required_joins: []
  }

  join: view_01273 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01270.account_id} = ${view_01273.account_id} ;;
    required_joins: [view_01272]
  }

  join: view_01274 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01270.category} = ${view_01274.category} ;;
  }

  access_filter: {
    field: view_01270.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01270.is_deleted} = false ;;
}
