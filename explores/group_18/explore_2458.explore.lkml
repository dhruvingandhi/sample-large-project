# Explore: explore_2458
# Auto-generated LookML Explore File

include: "/views/domain_25/view_07375.view.lkml"
include: "/views/domain_27/view_07377.view.lkml"
include: "/views/domain_28/view_07378.view.lkml"
include: "/views/domain_29/view_07379.view.lkml"

explore: explore_2458 {
  label: "Explore Explore 2458"
  description: "Comprehensive analytics explore joining base view_07375 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_07375
  
  always_filter: {
    filters: [view_07375.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07375.created_at_date: "7 days"]
    unless: [view_07375.id, view_07375.status]
  }

  join: view_07377 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07375.user_id} = ${view_07377.id} ;;
    required_joins: []
  }

  join: view_07378 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07375.account_id} = ${view_07378.account_id} ;;
    required_joins: [view_07377]
  }

  join: view_07379 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07375.category} = ${view_07379.category} ;;
  }

  access_filter: {
    field: view_07375.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07375.is_deleted} = false ;;
}
