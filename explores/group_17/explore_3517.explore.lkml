# Explore: explore_3517
# Auto-generated LookML Explore File

include: "/views/domain_02/view_10552.view.lkml"
include: "/views/domain_04/view_10554.view.lkml"
include: "/views/domain_05/view_10555.view.lkml"
include: "/views/domain_06/view_10556.view.lkml"

explore: explore_3517 {
  label: "Explore Explore 3517"
  description: "Comprehensive analytics explore joining base view_10552 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_10552
  
  always_filter: {
    filters: [view_10552.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10552.created_at_date: "7 days"]
    unless: [view_10552.id, view_10552.status]
  }

  join: view_10554 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10552.user_id} = ${view_10554.id} ;;
    required_joins: []
  }

  join: view_10555 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10552.account_id} = ${view_10555.account_id} ;;
    required_joins: [view_10554]
  }

  join: view_10556 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10552.category} = ${view_10556.category} ;;
  }

  access_filter: {
    field: view_10552.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10552.is_deleted} = false ;;
}
