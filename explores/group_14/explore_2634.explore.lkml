# Explore: explore_2634
# Auto-generated LookML Explore File

include: "/views/domain_03/view_07903.view.lkml"
include: "/views/domain_05/view_07905.view.lkml"
include: "/views/domain_06/view_07906.view.lkml"
include: "/views/domain_07/view_07907.view.lkml"

explore: explore_2634 {
  label: "Explore Explore 2634"
  description: "Comprehensive analytics explore joining base view_07903 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07903
  
  always_filter: {
    filters: [view_07903.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07903.created_at_date: "7 days"]
    unless: [view_07903.id, view_07903.status]
  }

  join: view_07905 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07903.user_id} = ${view_07905.id} ;;
    required_joins: []
  }

  join: view_07906 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07903.account_id} = ${view_07906.account_id} ;;
    required_joins: [view_07905]
  }

  join: view_07907 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07903.category} = ${view_07907.category} ;;
  }

  access_filter: {
    field: view_07903.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07903.is_deleted} = false ;;
}
