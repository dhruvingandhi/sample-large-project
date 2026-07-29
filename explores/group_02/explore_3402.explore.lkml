# Explore: explore_3402
# Auto-generated LookML Explore File

include: "/views/domain_07/view_10207.view.lkml"
include: "/views/domain_09/view_10209.view.lkml"
include: "/views/domain_10/view_10210.view.lkml"
include: "/views/domain_11/view_10211.view.lkml"

explore: explore_3402 {
  label: "Explore Explore 3402"
  description: "Comprehensive analytics explore joining base view_10207 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_10207
  
  always_filter: {
    filters: [view_10207.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10207.created_at_date: "7 days"]
    unless: [view_10207.id, view_10207.status]
  }

  join: view_10209 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10207.user_id} = ${view_10209.id} ;;
    required_joins: []
  }

  join: view_10210 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10207.account_id} = ${view_10210.account_id} ;;
    required_joins: [view_10209]
  }

  join: view_10211 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10207.category} = ${view_10211.category} ;;
  }

  access_filter: {
    field: view_10207.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10207.is_deleted} = false ;;
}
