# Update for 2000 file diff target
# Explore: explore_0819
# Auto-generated LookML Explore File

include: "/views/domain_08/view_02458.view.lkml"
include: "/views/domain_10/view_02460.view.lkml"
include: "/views/domain_11/view_02461.view.lkml"
include: "/views/domain_12/view_02462.view.lkml"

explore: explore_0819 {
  label: "Explore Explore 0819"
  description: "Comprehensive analytics explore joining base view_02458 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_02458
  
  always_filter: {
    filters: [view_02458.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02458.created_at_date: "7 days"]
    unless: [view_02458.id, view_02458.status]
  }

  join: view_02460 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02458.user_id} = ${view_02460.id} ;;
    required_joins: []
  }

  join: view_02461 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02458.account_id} = ${view_02461.account_id} ;;
    required_joins: [view_02460]
  }

  join: view_02462 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02458.category} = ${view_02462.category} ;;
  }

  access_filter: {
    field: view_02458.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02458.is_deleted} = false ;;
}
