# Explore: explore_3832
# Auto-generated LookML Explore File

include: "/views/domain_47/view_11497.view.lkml"
include: "/views/domain_49/view_11499.view.lkml"
include: "/views/domain_50/view_11500.view.lkml"
include: "/views/domain_01/view_11501.view.lkml"

explore: explore_3832 {
  label: "Explore Explore 3832"
  description: "Comprehensive analytics explore joining base view_11497 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11497
  
  always_filter: {
    filters: [view_11497.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11497.created_at_date: "7 days"]
    unless: [view_11497.id, view_11497.status]
  }

  join: view_11499 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11497.user_id} = ${view_11499.id} ;;
    required_joins: []
  }

  join: view_11500 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11497.account_id} = ${view_11500.account_id} ;;
    required_joins: [view_11499]
  }

  join: view_11501 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11497.category} = ${view_11501.category} ;;
  }

  access_filter: {
    field: view_11497.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11497.is_deleted} = false ;;
}
