# Explore: explore_0387
# Auto-generated LookML Explore File

include: "/views/domain_12/view_01162.view.lkml"
include: "/views/domain_14/view_01164.view.lkml"
include: "/views/domain_15/view_01165.view.lkml"
include: "/views/domain_16/view_01166.view.lkml"

explore: explore_0387 {
  label: "Explore Explore 0387"
  description: "Comprehensive analytics explore joining base view_01162 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_01162
  
  always_filter: {
    filters: [view_01162.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01162.created_at_date: "7 days"]
    unless: [view_01162.id, view_01162.status]
  }

  join: view_01164 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01162.user_id} = ${view_01164.id} ;;
    required_joins: []
  }

  join: view_01165 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01162.account_id} = ${view_01165.account_id} ;;
    required_joins: [view_01164]
  }

  join: view_01166 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01162.category} = ${view_01166.category} ;;
  }

  access_filter: {
    field: view_01162.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01162.is_deleted} = false ;;
}
