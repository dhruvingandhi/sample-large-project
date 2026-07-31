# Update for 500 file diff target
# Explore: explore_0522
# Auto-generated LookML Explore File

include: "/views/domain_17/view_01567.view.lkml"
include: "/views/domain_19/view_01569.view.lkml"
include: "/views/domain_20/view_01570.view.lkml"
include: "/views/domain_21/view_01571.view.lkml"

explore: explore_0522 {
  label: "Explore Explore 0522"
  description: "Comprehensive analytics explore joining base view_01567 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_01567
  
  always_filter: {
    filters: [view_01567.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01567.created_at_date: "7 days"]
    unless: [view_01567.id, view_01567.status]
  }

  join: view_01569 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01567.user_id} = ${view_01569.id} ;;
    required_joins: []
  }

  join: view_01570 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01567.account_id} = ${view_01570.account_id} ;;
    required_joins: [view_01569]
  }

  join: view_01571 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01567.category} = ${view_01571.category} ;;
  }

  access_filter: {
    field: view_01567.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01567.is_deleted} = false ;;
}
