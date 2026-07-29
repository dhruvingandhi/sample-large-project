# Explore: explore_3892
# Auto-generated LookML Explore File

include: "/views/domain_27/view_11677.view.lkml"
include: "/views/domain_29/view_11679.view.lkml"
include: "/views/domain_30/view_11680.view.lkml"
include: "/views/domain_31/view_11681.view.lkml"

explore: explore_3892 {
  label: "Explore Explore 3892"
  description: "Comprehensive analytics explore joining base view_11677 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_11677
  
  always_filter: {
    filters: [view_11677.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11677.created_at_date: "7 days"]
    unless: [view_11677.id, view_11677.status]
  }

  join: view_11679 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11677.user_id} = ${view_11679.id} ;;
    required_joins: []
  }

  join: view_11680 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11677.account_id} = ${view_11680.account_id} ;;
    required_joins: [view_11679]
  }

  join: view_11681 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11677.category} = ${view_11681.category} ;;
  }

  access_filter: {
    field: view_11677.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11677.is_deleted} = false ;;
}
