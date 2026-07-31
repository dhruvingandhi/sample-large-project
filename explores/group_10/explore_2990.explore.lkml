# Update for 2000 file diff target
# Explore: explore_2990
# Auto-generated LookML Explore File

include: "/views/domain_21/view_08971.view.lkml"
include: "/views/domain_23/view_08973.view.lkml"
include: "/views/domain_24/view_08974.view.lkml"
include: "/views/domain_25/view_08975.view.lkml"

explore: explore_2990 {
  label: "Explore Explore 2990"
  description: "Comprehensive analytics explore joining base view_08971 with related tables."
  group_label: "Analytics Domain 11"
  
  view_name: view_08971
  
  always_filter: {
    filters: [view_08971.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08971.created_at_date: "7 days"]
    unless: [view_08971.id, view_08971.status]
  }

  join: view_08973 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08971.user_id} = ${view_08973.id} ;;
    required_joins: []
  }

  join: view_08974 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08971.account_id} = ${view_08974.account_id} ;;
    required_joins: [view_08973]
  }

  join: view_08975 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08971.category} = ${view_08975.category} ;;
  }

  access_filter: {
    field: view_08971.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08971.is_deleted} = false ;;
}
