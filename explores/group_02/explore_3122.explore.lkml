# Explore: explore_3122
# Auto-generated LookML Explore File

include: "/views/domain_17/view_09367.view.lkml"
include: "/views/domain_19/view_09369.view.lkml"
include: "/views/domain_20/view_09370.view.lkml"
include: "/views/domain_21/view_09371.view.lkml"

explore: explore_3122 {
  label: "Explore Explore 3122"
  description: "Comprehensive analytics explore joining base view_09367 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_09367
  
  always_filter: {
    filters: [view_09367.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09367.created_at_date: "7 days"]
    unless: [view_09367.id, view_09367.status]
  }

  join: view_09369 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09367.user_id} = ${view_09369.id} ;;
    required_joins: []
  }

  join: view_09370 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09367.account_id} = ${view_09370.account_id} ;;
    required_joins: [view_09369]
  }

  join: view_09371 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09367.category} = ${view_09371.category} ;;
  }

  access_filter: {
    field: view_09367.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09367.is_deleted} = false ;;
}
