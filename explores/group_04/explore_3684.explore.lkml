# Explore: explore_3684
# Auto-generated LookML Explore File

include: "/views/domain_03/view_11053.view.lkml"
include: "/views/domain_05/view_11055.view.lkml"
include: "/views/domain_06/view_11056.view.lkml"
include: "/views/domain_07/view_11057.view.lkml"

explore: explore_3684 {
  label: "Explore Explore 3684"
  description: "Comprehensive analytics explore joining base view_11053 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_11053
  
  always_filter: {
    filters: [view_11053.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11053.created_at_date: "7 days"]
    unless: [view_11053.id, view_11053.status]
  }

  join: view_11055 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11053.user_id} = ${view_11055.id} ;;
    required_joins: []
  }

  join: view_11056 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11053.account_id} = ${view_11056.account_id} ;;
    required_joins: [view_11055]
  }

  join: view_11057 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11053.category} = ${view_11057.category} ;;
  }

  access_filter: {
    field: view_11053.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11053.is_deleted} = false ;;
}
