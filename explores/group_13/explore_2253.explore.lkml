# Explore: explore_2253
# Auto-generated LookML Explore File

include: "/views/domain_10/view_06760.view.lkml"
include: "/views/domain_12/view_06762.view.lkml"
include: "/views/domain_13/view_06763.view.lkml"
include: "/views/domain_14/view_06764.view.lkml"

explore: explore_2253 {
  label: "Explore Explore 2253"
  description: "Comprehensive analytics explore joining base view_06760 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_06760
  
  always_filter: {
    filters: [view_06760.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06760.created_at_date: "7 days"]
    unless: [view_06760.id, view_06760.status]
  }

  join: view_06762 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06760.user_id} = ${view_06762.id} ;;
    required_joins: []
  }

  join: view_06763 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06760.account_id} = ${view_06763.account_id} ;;
    required_joins: [view_06762]
  }

  join: view_06764 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06760.category} = ${view_06764.category} ;;
  }

  access_filter: {
    field: view_06760.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06760.is_deleted} = false ;;
}
