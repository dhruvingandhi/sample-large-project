# Update for 2000 file diff target
# Explore: explore_2520
# Auto-generated LookML Explore File

include: "/views/domain_11/view_07561.view.lkml"
include: "/views/domain_13/view_07563.view.lkml"
include: "/views/domain_14/view_07564.view.lkml"
include: "/views/domain_15/view_07565.view.lkml"

explore: explore_2520 {
  label: "Explore Explore 2520"
  description: "Comprehensive analytics explore joining base view_07561 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_07561
  
  always_filter: {
    filters: [view_07561.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07561.created_at_date: "7 days"]
    unless: [view_07561.id, view_07561.status]
  }

  join: view_07563 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07561.user_id} = ${view_07563.id} ;;
    required_joins: []
  }

  join: view_07564 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07561.account_id} = ${view_07564.account_id} ;;
    required_joins: [view_07563]
  }

  join: view_07565 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07561.category} = ${view_07565.category} ;;
  }

  access_filter: {
    field: view_07561.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07561.is_deleted} = false ;;
}
