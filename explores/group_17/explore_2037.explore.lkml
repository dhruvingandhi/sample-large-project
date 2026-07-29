# Explore: explore_2037
# Auto-generated LookML Explore File

include: "/views/domain_12/view_06112.view.lkml"
include: "/views/domain_14/view_06114.view.lkml"
include: "/views/domain_15/view_06115.view.lkml"
include: "/views/domain_16/view_06116.view.lkml"

explore: explore_2037 {
  label: "Explore Explore 2037"
  description: "Comprehensive analytics explore joining base view_06112 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06112
  
  always_filter: {
    filters: [view_06112.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06112.created_at_date: "7 days"]
    unless: [view_06112.id, view_06112.status]
  }

  join: view_06114 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06112.user_id} = ${view_06114.id} ;;
    required_joins: []
  }

  join: view_06115 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06112.account_id} = ${view_06115.account_id} ;;
    required_joins: [view_06114]
  }

  join: view_06116 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06112.category} = ${view_06116.category} ;;
  }

  access_filter: {
    field: view_06112.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06112.is_deleted} = false ;;
}
