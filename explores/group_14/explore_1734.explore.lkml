# Explore: explore_1734
# Auto-generated LookML Explore File

include: "/views/domain_03/view_05203.view.lkml"
include: "/views/domain_05/view_05205.view.lkml"
include: "/views/domain_06/view_05206.view.lkml"
include: "/views/domain_07/view_05207.view.lkml"

explore: explore_1734 {
  label: "Explore Explore 1734"
  description: "Comprehensive analytics explore joining base view_05203 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_05203
  
  always_filter: {
    filters: [view_05203.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05203.created_at_date: "7 days"]
    unless: [view_05203.id, view_05203.status]
  }

  join: view_05205 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05203.user_id} = ${view_05205.id} ;;
    required_joins: []
  }

  join: view_05206 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05203.account_id} = ${view_05206.account_id} ;;
    required_joins: [view_05205]
  }

  join: view_05207 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05203.category} = ${view_05207.category} ;;
  }

  access_filter: {
    field: view_05203.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05203.is_deleted} = false ;;
}
