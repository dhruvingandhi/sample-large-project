# Update for 500 file diff target
# Explore: explore_2402
# Auto-generated LookML Explore File

include: "/views/domain_07/view_07207.view.lkml"
include: "/views/domain_09/view_07209.view.lkml"
include: "/views/domain_10/view_07210.view.lkml"
include: "/views/domain_11/view_07211.view.lkml"

explore: explore_2402 {
  label: "Explore Explore 2402"
  description: "Comprehensive analytics explore joining base view_07207 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_07207
  
  always_filter: {
    filters: [view_07207.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07207.created_at_date: "7 days"]
    unless: [view_07207.id, view_07207.status]
  }

  join: view_07209 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07207.user_id} = ${view_07209.id} ;;
    required_joins: []
  }

  join: view_07210 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07207.account_id} = ${view_07210.account_id} ;;
    required_joins: [view_07209]
  }

  join: view_07211 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07207.category} = ${view_07211.category} ;;
  }

  access_filter: {
    field: view_07207.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07207.is_deleted} = false ;;
}
