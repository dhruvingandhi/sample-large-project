# Explore: explore_0436
# Auto-generated LookML Explore File

include: "/views/domain_09/view_01309.view.lkml"
include: "/views/domain_11/view_01311.view.lkml"
include: "/views/domain_12/view_01312.view.lkml"
include: "/views/domain_13/view_01313.view.lkml"

explore: explore_0436 {
  label: "Explore Explore 0436"
  description: "Comprehensive analytics explore joining base view_01309 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_01309
  
  always_filter: {
    filters: [view_01309.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01309.created_at_date: "7 days"]
    unless: [view_01309.id, view_01309.status]
  }

  join: view_01311 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01309.user_id} = ${view_01311.id} ;;
    required_joins: []
  }

  join: view_01312 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01309.account_id} = ${view_01312.account_id} ;;
    required_joins: [view_01311]
  }

  join: view_01313 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01309.category} = ${view_01313.category} ;;
  }

  access_filter: {
    field: view_01309.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01309.is_deleted} = false ;;
}
