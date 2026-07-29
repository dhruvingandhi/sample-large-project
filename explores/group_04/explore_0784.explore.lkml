# Explore: explore_0784
# Auto-generated LookML Explore File

include: "/views/domain_03/view_02353.view.lkml"
include: "/views/domain_05/view_02355.view.lkml"
include: "/views/domain_06/view_02356.view.lkml"
include: "/views/domain_07/view_02357.view.lkml"

explore: explore_0784 {
  label: "Explore Explore 0784"
  description: "Comprehensive analytics explore joining base view_02353 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_02353
  
  always_filter: {
    filters: [view_02353.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02353.created_at_date: "7 days"]
    unless: [view_02353.id, view_02353.status]
  }

  join: view_02355 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02353.user_id} = ${view_02355.id} ;;
    required_joins: []
  }

  join: view_02356 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02353.account_id} = ${view_02356.account_id} ;;
    required_joins: [view_02355]
  }

  join: view_02357 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02353.category} = ${view_02357.category} ;;
  }

  access_filter: {
    field: view_02353.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02353.is_deleted} = false ;;
}
