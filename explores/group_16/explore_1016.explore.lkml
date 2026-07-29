# Explore: explore_1016
# Auto-generated LookML Explore File

include: "/views/domain_49/view_03049.view.lkml"
include: "/views/domain_01/view_03051.view.lkml"
include: "/views/domain_02/view_03052.view.lkml"
include: "/views/domain_03/view_03053.view.lkml"

explore: explore_1016 {
  label: "Explore Explore 1016"
  description: "Comprehensive analytics explore joining base view_03049 with related tables."
  group_label: "Analytics Domain 17"
  
  view_name: view_03049
  
  always_filter: {
    filters: [view_03049.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03049.created_at_date: "7 days"]
    unless: [view_03049.id, view_03049.status]
  }

  join: view_03051 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03049.user_id} = ${view_03051.id} ;;
    required_joins: []
  }

  join: view_03052 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03049.account_id} = ${view_03052.account_id} ;;
    required_joins: [view_03051]
  }

  join: view_03053 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03049.category} = ${view_03053.category} ;;
  }

  access_filter: {
    field: view_03049.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03049.is_deleted} = false ;;
}
