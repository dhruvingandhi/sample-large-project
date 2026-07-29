# Explore: explore_3422
# Auto-generated LookML Explore File

include: "/views/domain_17/view_10267.view.lkml"
include: "/views/domain_19/view_10269.view.lkml"
include: "/views/domain_20/view_10270.view.lkml"
include: "/views/domain_21/view_10271.view.lkml"

explore: explore_3422 {
  label: "Explore Explore 3422"
  description: "Comprehensive analytics explore joining base view_10267 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10267
  
  always_filter: {
    filters: [view_10267.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10267.created_at_date: "7 days"]
    unless: [view_10267.id, view_10267.status]
  }

  join: view_10269 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10267.user_id} = ${view_10269.id} ;;
    required_joins: []
  }

  join: view_10270 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10267.account_id} = ${view_10270.account_id} ;;
    required_joins: [view_10269]
  }

  join: view_10271 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10267.category} = ${view_10271.category} ;;
  }

  access_filter: {
    field: view_10267.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10267.is_deleted} = false ;;
}
