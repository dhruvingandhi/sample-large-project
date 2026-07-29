# Explore: explore_2026
# Auto-generated LookML Explore File

include: "/views/domain_29/view_06079.view.lkml"
include: "/views/domain_31/view_06081.view.lkml"
include: "/views/domain_32/view_06082.view.lkml"
include: "/views/domain_33/view_06083.view.lkml"

explore: explore_2026 {
  label: "Explore Explore 2026"
  description: "Comprehensive analytics explore joining base view_06079 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_06079
  
  always_filter: {
    filters: [view_06079.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06079.created_at_date: "7 days"]
    unless: [view_06079.id, view_06079.status]
  }

  join: view_06081 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06079.user_id} = ${view_06081.id} ;;
    required_joins: []
  }

  join: view_06082 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06079.account_id} = ${view_06082.account_id} ;;
    required_joins: [view_06081]
  }

  join: view_06083 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06079.category} = ${view_06083.category} ;;
  }

  access_filter: {
    field: view_06079.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06079.is_deleted} = false ;;
}
