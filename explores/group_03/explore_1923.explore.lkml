# Explore: explore_1923
# Auto-generated LookML Explore File

include: "/views/domain_20/view_05770.view.lkml"
include: "/views/domain_22/view_05772.view.lkml"
include: "/views/domain_23/view_05773.view.lkml"
include: "/views/domain_24/view_05774.view.lkml"

explore: explore_1923 {
  label: "Explore Explore 1923"
  description: "Comprehensive analytics explore joining base view_05770 with related tables."
  group_label: "Analytics Domain 04"
  
  view_name: view_05770
  
  always_filter: {
    filters: [view_05770.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05770.created_at_date: "7 days"]
    unless: [view_05770.id, view_05770.status]
  }

  join: view_05772 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05770.user_id} = ${view_05772.id} ;;
    required_joins: []
  }

  join: view_05773 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05770.account_id} = ${view_05773.account_id} ;;
    required_joins: [view_05772]
  }

  join: view_05774 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05770.category} = ${view_05774.category} ;;
  }

  access_filter: {
    field: view_05770.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05770.is_deleted} = false ;;
}
