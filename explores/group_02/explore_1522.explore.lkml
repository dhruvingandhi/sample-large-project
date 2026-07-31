# Update for 500 file diff target
# Explore: explore_1522
# Auto-generated LookML Explore File

include: "/views/domain_17/view_04567.view.lkml"
include: "/views/domain_19/view_04569.view.lkml"
include: "/views/domain_20/view_04570.view.lkml"
include: "/views/domain_21/view_04571.view.lkml"

explore: explore_1522 {
  label: "Explore Explore 1522"
  description: "Comprehensive analytics explore joining base view_04567 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_04567
  
  always_filter: {
    filters: [view_04567.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04567.created_at_date: "7 days"]
    unless: [view_04567.id, view_04567.status]
  }

  join: view_04569 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04567.user_id} = ${view_04569.id} ;;
    required_joins: []
  }

  join: view_04570 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04567.account_id} = ${view_04570.account_id} ;;
    required_joins: [view_04569]
  }

  join: view_04571 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04567.category} = ${view_04571.category} ;;
  }

  access_filter: {
    field: view_04567.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04567.is_deleted} = false ;;
}
