# Explore: explore_1921
# Auto-generated LookML Explore File

include: "/views/domain_14/view_05764.view.lkml"
include: "/views/domain_16/view_05766.view.lkml"
include: "/views/domain_17/view_05767.view.lkml"
include: "/views/domain_18/view_05768.view.lkml"

explore: explore_1921 {
  label: "Explore Explore 1921"
  description: "Comprehensive analytics explore joining base view_05764 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05764
  
  always_filter: {
    filters: [view_05764.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05764.created_at_date: "7 days"]
    unless: [view_05764.id, view_05764.status]
  }

  join: view_05766 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05764.user_id} = ${view_05766.id} ;;
    required_joins: []
  }

  join: view_05767 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05764.account_id} = ${view_05767.account_id} ;;
    required_joins: [view_05766]
  }

  join: view_05768 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05764.category} = ${view_05768.category} ;;
  }

  access_filter: {
    field: view_05764.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05764.is_deleted} = false ;;
}
