# Explore: explore_3368
# Auto-generated LookML Explore File

include: "/views/domain_05/view_10105.view.lkml"
include: "/views/domain_07/view_10107.view.lkml"
include: "/views/domain_08/view_10108.view.lkml"
include: "/views/domain_09/view_10109.view.lkml"

explore: explore_3368 {
  label: "Explore Explore 3368"
  description: "Comprehensive analytics explore joining base view_10105 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_10105
  
  always_filter: {
    filters: [view_10105.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10105.created_at_date: "7 days"]
    unless: [view_10105.id, view_10105.status]
  }

  join: view_10107 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10105.user_id} = ${view_10107.id} ;;
    required_joins: []
  }

  join: view_10108 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10105.account_id} = ${view_10108.account_id} ;;
    required_joins: [view_10107]
  }

  join: view_10109 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10105.category} = ${view_10109.category} ;;
  }

  access_filter: {
    field: view_10105.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10105.is_deleted} = false ;;
}
