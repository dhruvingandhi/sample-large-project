# Explore: explore_3634
# Auto-generated LookML Explore File

include: "/views/domain_03/view_10903.view.lkml"
include: "/views/domain_05/view_10905.view.lkml"
include: "/views/domain_06/view_10906.view.lkml"
include: "/views/domain_07/view_10907.view.lkml"

explore: explore_3634 {
  label: "Explore Explore 3634"
  description: "Comprehensive analytics explore joining base view_10903 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_10903
  
  always_filter: {
    filters: [view_10903.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10903.created_at_date: "7 days"]
    unless: [view_10903.id, view_10903.status]
  }

  join: view_10905 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10903.user_id} = ${view_10905.id} ;;
    required_joins: []
  }

  join: view_10906 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10903.account_id} = ${view_10906.account_id} ;;
    required_joins: [view_10905]
  }

  join: view_10907 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10903.category} = ${view_10907.category} ;;
  }

  access_filter: {
    field: view_10903.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10903.is_deleted} = false ;;
}
