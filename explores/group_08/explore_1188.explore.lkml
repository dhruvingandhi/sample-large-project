# Explore: explore_1188
# Auto-generated LookML Explore File

include: "/views/domain_15/view_03565.view.lkml"
include: "/views/domain_17/view_03567.view.lkml"
include: "/views/domain_18/view_03568.view.lkml"
include: "/views/domain_19/view_03569.view.lkml"

explore: explore_1188 {
  label: "Explore Explore 1188"
  description: "Comprehensive analytics explore joining base view_03565 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_03565
  
  always_filter: {
    filters: [view_03565.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03565.created_at_date: "7 days"]
    unless: [view_03565.id, view_03565.status]
  }

  join: view_03567 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03565.user_id} = ${view_03567.id} ;;
    required_joins: []
  }

  join: view_03568 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03565.account_id} = ${view_03568.account_id} ;;
    required_joins: [view_03567]
  }

  join: view_03569 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03565.category} = ${view_03569.category} ;;
  }

  access_filter: {
    field: view_03565.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03565.is_deleted} = false ;;
}
