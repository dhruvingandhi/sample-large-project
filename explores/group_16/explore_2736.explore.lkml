# Explore: explore_2736
# Auto-generated LookML Explore File

include: "/views/domain_09/view_08209.view.lkml"
include: "/views/domain_11/view_08211.view.lkml"
include: "/views/domain_12/view_08212.view.lkml"
include: "/views/domain_13/view_08213.view.lkml"

explore: explore_2736 {
  label: "Explore Explore 2736"
  description: "Comprehensive analytics explore joining base view_08209 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_08209
  
  always_filter: {
    filters: [view_08209.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08209.created_at_date: "7 days"]
    unless: [view_08209.id, view_08209.status]
  }

  join: view_08211 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08209.user_id} = ${view_08211.id} ;;
    required_joins: []
  }

  join: view_08212 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08209.account_id} = ${view_08212.account_id} ;;
    required_joins: [view_08211]
  }

  join: view_08213 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08209.category} = ${view_08213.category} ;;
  }

  access_filter: {
    field: view_08209.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08209.is_deleted} = false ;;
}
