# Explore: explore_1634
# Auto-generated LookML Explore File

include: "/views/domain_03/view_04903.view.lkml"
include: "/views/domain_05/view_04905.view.lkml"
include: "/views/domain_06/view_04906.view.lkml"
include: "/views/domain_07/view_04907.view.lkml"

explore: explore_1634 {
  label: "Explore Explore 1634"
  description: "Comprehensive analytics explore joining base view_04903 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_04903
  
  always_filter: {
    filters: [view_04903.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04903.created_at_date: "7 days"]
    unless: [view_04903.id, view_04903.status]
  }

  join: view_04905 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04903.user_id} = ${view_04905.id} ;;
    required_joins: []
  }

  join: view_04906 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04903.account_id} = ${view_04906.account_id} ;;
    required_joins: [view_04905]
  }

  join: view_04907 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04903.category} = ${view_04907.category} ;;
  }

  access_filter: {
    field: view_04903.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04903.is_deleted} = false ;;
}
