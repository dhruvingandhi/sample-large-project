# Explore: explore_0432
# Auto-generated LookML Explore File

include: "/views/domain_47/view_01297.view.lkml"
include: "/views/domain_49/view_01299.view.lkml"
include: "/views/domain_50/view_01300.view.lkml"
include: "/views/domain_01/view_01301.view.lkml"

explore: explore_0432 {
  label: "Explore Explore 0432"
  description: "Comprehensive analytics explore joining base view_01297 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_01297
  
  always_filter: {
    filters: [view_01297.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01297.created_at_date: "7 days"]
    unless: [view_01297.id, view_01297.status]
  }

  join: view_01299 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01297.user_id} = ${view_01299.id} ;;
    required_joins: []
  }

  join: view_01300 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01297.account_id} = ${view_01300.account_id} ;;
    required_joins: [view_01299]
  }

  join: view_01301 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01297.category} = ${view_01301.category} ;;
  }

  access_filter: {
    field: view_01297.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01297.is_deleted} = false ;;
}
