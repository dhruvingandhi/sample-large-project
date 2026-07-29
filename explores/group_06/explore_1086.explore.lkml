# Explore: explore_1086
# Auto-generated LookML Explore File

include: "/views/domain_09/view_03259.view.lkml"
include: "/views/domain_11/view_03261.view.lkml"
include: "/views/domain_12/view_03262.view.lkml"
include: "/views/domain_13/view_03263.view.lkml"

explore: explore_1086 {
  label: "Explore Explore 1086"
  description: "Comprehensive analytics explore joining base view_03259 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_03259
  
  always_filter: {
    filters: [view_03259.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03259.created_at_date: "7 days"]
    unless: [view_03259.id, view_03259.status]
  }

  join: view_03261 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03259.user_id} = ${view_03261.id} ;;
    required_joins: []
  }

  join: view_03262 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03259.account_id} = ${view_03262.account_id} ;;
    required_joins: [view_03261]
  }

  join: view_03263 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03259.category} = ${view_03263.category} ;;
  }

  access_filter: {
    field: view_03259.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03259.is_deleted} = false ;;
}
