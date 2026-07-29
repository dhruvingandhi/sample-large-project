# Explore: explore_0468
# Auto-generated LookML Explore File

include: "/views/domain_05/view_01405.view.lkml"
include: "/views/domain_07/view_01407.view.lkml"
include: "/views/domain_08/view_01408.view.lkml"
include: "/views/domain_09/view_01409.view.lkml"

explore: explore_0468 {
  label: "Explore Explore 0468"
  description: "Comprehensive analytics explore joining base view_01405 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01405
  
  always_filter: {
    filters: [view_01405.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01405.created_at_date: "7 days"]
    unless: [view_01405.id, view_01405.status]
  }

  join: view_01407 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01405.user_id} = ${view_01407.id} ;;
    required_joins: []
  }

  join: view_01408 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01405.account_id} = ${view_01408.account_id} ;;
    required_joins: [view_01407]
  }

  join: view_01409 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01405.category} = ${view_01409.category} ;;
  }

  access_filter: {
    field: view_01405.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01405.is_deleted} = false ;;
}
