# Explore: explore_0402
# Auto-generated LookML Explore File

include: "/views/domain_07/view_01207.view.lkml"
include: "/views/domain_09/view_01209.view.lkml"
include: "/views/domain_10/view_01210.view.lkml"
include: "/views/domain_11/view_01211.view.lkml"

explore: explore_0402 {
  label: "Explore Explore 0402"
  description: "Comprehensive analytics explore joining base view_01207 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01207
  
  always_filter: {
    filters: [view_01207.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01207.created_at_date: "7 days"]
    unless: [view_01207.id, view_01207.status]
  }

  join: view_01209 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01207.user_id} = ${view_01209.id} ;;
    required_joins: []
  }

  join: view_01210 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01207.account_id} = ${view_01210.account_id} ;;
    required_joins: [view_01209]
  }

  join: view_01211 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01207.category} = ${view_01211.category} ;;
  }

  access_filter: {
    field: view_01207.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01207.is_deleted} = false ;;
}
