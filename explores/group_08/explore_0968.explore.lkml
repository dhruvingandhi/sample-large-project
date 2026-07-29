# Explore: explore_0968
# Auto-generated LookML Explore File

include: "/views/domain_05/view_02905.view.lkml"
include: "/views/domain_07/view_02907.view.lkml"
include: "/views/domain_08/view_02908.view.lkml"
include: "/views/domain_09/view_02909.view.lkml"

explore: explore_0968 {
  label: "Explore Explore 0968"
  description: "Comprehensive analytics explore joining base view_02905 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_02905
  
  always_filter: {
    filters: [view_02905.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02905.created_at_date: "7 days"]
    unless: [view_02905.id, view_02905.status]
  }

  join: view_02907 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02905.user_id} = ${view_02907.id} ;;
    required_joins: []
  }

  join: view_02908 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02905.account_id} = ${view_02908.account_id} ;;
    required_joins: [view_02907]
  }

  join: view_02909 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02905.category} = ${view_02909.category} ;;
  }

  access_filter: {
    field: view_02905.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02905.is_deleted} = false ;;
}
