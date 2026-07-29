# Explore: explore_1892
# Auto-generated LookML Explore File

include: "/views/domain_27/view_05677.view.lkml"
include: "/views/domain_29/view_05679.view.lkml"
include: "/views/domain_30/view_05680.view.lkml"
include: "/views/domain_31/view_05681.view.lkml"

explore: explore_1892 {
  label: "Explore Explore 1892"
  description: "Comprehensive analytics explore joining base view_05677 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05677
  
  always_filter: {
    filters: [view_05677.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05677.created_at_date: "7 days"]
    unless: [view_05677.id, view_05677.status]
  }

  join: view_05679 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05677.user_id} = ${view_05679.id} ;;
    required_joins: []
  }

  join: view_05680 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05677.account_id} = ${view_05680.account_id} ;;
    required_joins: [view_05679]
  }

  join: view_05681 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05677.category} = ${view_05681.category} ;;
  }

  access_filter: {
    field: view_05677.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05677.is_deleted} = false ;;
}
