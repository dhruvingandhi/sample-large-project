# Explore: explore_1743
# Auto-generated LookML Explore File

include: "/views/domain_30/view_05230.view.lkml"
include: "/views/domain_32/view_05232.view.lkml"
include: "/views/domain_33/view_05233.view.lkml"
include: "/views/domain_34/view_05234.view.lkml"

explore: explore_1743 {
  label: "Explore Explore 1743"
  description: "Comprehensive analytics explore joining base view_05230 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05230
  
  always_filter: {
    filters: [view_05230.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05230.created_at_date: "7 days"]
    unless: [view_05230.id, view_05230.status]
  }

  join: view_05232 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05230.user_id} = ${view_05232.id} ;;
    required_joins: []
  }

  join: view_05233 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05230.account_id} = ${view_05233.account_id} ;;
    required_joins: [view_05232]
  }

  join: view_05234 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05230.category} = ${view_05234.category} ;;
  }

  access_filter: {
    field: view_05230.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05230.is_deleted} = false ;;
}
