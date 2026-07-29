# Explore: explore_0368
# Auto-generated LookML Explore File

include: "/views/domain_05/view_01105.view.lkml"
include: "/views/domain_07/view_01107.view.lkml"
include: "/views/domain_08/view_01108.view.lkml"
include: "/views/domain_09/view_01109.view.lkml"

explore: explore_0368 {
  label: "Explore Explore 0368"
  description: "Comprehensive analytics explore joining base view_01105 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_01105
  
  always_filter: {
    filters: [view_01105.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01105.created_at_date: "7 days"]
    unless: [view_01105.id, view_01105.status]
  }

  join: view_01107 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01105.user_id} = ${view_01107.id} ;;
    required_joins: []
  }

  join: view_01108 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01105.account_id} = ${view_01108.account_id} ;;
    required_joins: [view_01107]
  }

  join: view_01109 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01105.category} = ${view_01109.category} ;;
  }

  access_filter: {
    field: view_01105.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01105.is_deleted} = false ;;
}
