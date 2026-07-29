# Explore: explore_1736
# Auto-generated LookML Explore File

include: "/views/domain_09/view_05209.view.lkml"
include: "/views/domain_11/view_05211.view.lkml"
include: "/views/domain_12/view_05212.view.lkml"
include: "/views/domain_13/view_05213.view.lkml"

explore: explore_1736 {
  label: "Explore Explore 1736"
  description: "Comprehensive analytics explore joining base view_05209 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_05209
  
  always_filter: {
    filters: [view_05209.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05209.created_at_date: "7 days"]
    unless: [view_05209.id, view_05209.status]
  }

  join: view_05211 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05209.user_id} = ${view_05211.id} ;;
    required_joins: []
  }

  join: view_05212 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05209.account_id} = ${view_05212.account_id} ;;
    required_joins: [view_05211]
  }

  join: view_05213 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05209.category} = ${view_05213.category} ;;
  }

  access_filter: {
    field: view_05209.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05209.is_deleted} = false ;;
}
