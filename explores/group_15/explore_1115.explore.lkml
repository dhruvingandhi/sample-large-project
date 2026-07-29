# Explore: explore_1115
# Auto-generated LookML Explore File

include: "/views/domain_46/view_03346.view.lkml"
include: "/views/domain_48/view_03348.view.lkml"
include: "/views/domain_49/view_03349.view.lkml"
include: "/views/domain_50/view_03350.view.lkml"

explore: explore_1115 {
  label: "Explore Explore 1115"
  description: "Comprehensive analytics explore joining base view_03346 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_03346
  
  always_filter: {
    filters: [view_03346.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03346.created_at_date: "7 days"]
    unless: [view_03346.id, view_03346.status]
  }

  join: view_03348 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03346.user_id} = ${view_03348.id} ;;
    required_joins: []
  }

  join: view_03349 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03346.account_id} = ${view_03349.account_id} ;;
    required_joins: [view_03348]
  }

  join: view_03350 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03346.category} = ${view_03350.category} ;;
  }

  access_filter: {
    field: view_03346.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03346.is_deleted} = false ;;
}
