# Explore: explore_3155
# Auto-generated LookML Explore File

include: "/views/domain_16/view_09466.view.lkml"
include: "/views/domain_18/view_09468.view.lkml"
include: "/views/domain_19/view_09469.view.lkml"
include: "/views/domain_20/view_09470.view.lkml"

explore: explore_3155 {
  label: "Explore Explore 3155"
  description: "Comprehensive analytics explore joining base view_09466 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_09466
  
  always_filter: {
    filters: [view_09466.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09466.created_at_date: "7 days"]
    unless: [view_09466.id, view_09466.status]
  }

  join: view_09468 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09466.user_id} = ${view_09468.id} ;;
    required_joins: []
  }

  join: view_09469 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09466.account_id} = ${view_09469.account_id} ;;
    required_joins: [view_09468]
  }

  join: view_09470 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09466.category} = ${view_09470.category} ;;
  }

  access_filter: {
    field: view_09466.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09466.is_deleted} = false ;;
}
