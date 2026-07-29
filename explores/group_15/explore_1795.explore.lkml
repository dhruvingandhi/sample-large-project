# Explore: explore_1795
# Auto-generated LookML Explore File

include: "/views/domain_36/view_05386.view.lkml"
include: "/views/domain_38/view_05388.view.lkml"
include: "/views/domain_39/view_05389.view.lkml"
include: "/views/domain_40/view_05390.view.lkml"

explore: explore_1795 {
  label: "Explore Explore 1795"
  description: "Comprehensive analytics explore joining base view_05386 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05386
  
  always_filter: {
    filters: [view_05386.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05386.created_at_date: "7 days"]
    unless: [view_05386.id, view_05386.status]
  }

  join: view_05388 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05386.user_id} = ${view_05388.id} ;;
    required_joins: []
  }

  join: view_05389 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05386.account_id} = ${view_05389.account_id} ;;
    required_joins: [view_05388]
  }

  join: view_05390 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05386.category} = ${view_05390.category} ;;
  }

  access_filter: {
    field: view_05386.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05386.is_deleted} = false ;;
}
