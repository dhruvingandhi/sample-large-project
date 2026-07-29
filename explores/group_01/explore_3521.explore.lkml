# Explore: explore_3521
# Auto-generated LookML Explore File

include: "/views/domain_14/view_10564.view.lkml"
include: "/views/domain_16/view_10566.view.lkml"
include: "/views/domain_17/view_10567.view.lkml"
include: "/views/domain_18/view_10568.view.lkml"

explore: explore_3521 {
  label: "Explore Explore 3521"
  description: "Comprehensive analytics explore joining base view_10564 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10564
  
  always_filter: {
    filters: [view_10564.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10564.created_at_date: "7 days"]
    unless: [view_10564.id, view_10564.status]
  }

  join: view_10566 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10564.user_id} = ${view_10566.id} ;;
    required_joins: []
  }

  join: view_10567 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10564.account_id} = ${view_10567.account_id} ;;
    required_joins: [view_10566]
  }

  join: view_10568 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10564.category} = ${view_10568.category} ;;
  }

  access_filter: {
    field: view_10564.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10564.is_deleted} = false ;;
}
