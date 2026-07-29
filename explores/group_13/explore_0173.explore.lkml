# Explore: explore_0173
# Auto-generated LookML Explore File

include: "/views/domain_20/view_00520.view.lkml"
include: "/views/domain_22/view_00522.view.lkml"
include: "/views/domain_23/view_00523.view.lkml"
include: "/views/domain_24/view_00524.view.lkml"

explore: explore_0173 {
  label: "Explore Explore 0173"
  description: "Comprehensive analytics explore joining base view_00520 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_00520
  
  always_filter: {
    filters: [view_00520.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00520.created_at_date: "7 days"]
    unless: [view_00520.id, view_00520.status]
  }

  join: view_00522 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00520.user_id} = ${view_00522.id} ;;
    required_joins: []
  }

  join: view_00523 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00520.account_id} = ${view_00523.account_id} ;;
    required_joins: [view_00522]
  }

  join: view_00524 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00520.category} = ${view_00524.category} ;;
  }

  access_filter: {
    field: view_00520.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00520.is_deleted} = false ;;
}
