# Explore: explore_1387
# Auto-generated LookML Explore File

include: "/views/domain_12/view_04162.view.lkml"
include: "/views/domain_14/view_04164.view.lkml"
include: "/views/domain_15/view_04165.view.lkml"
include: "/views/domain_16/view_04166.view.lkml"

explore: explore_1387 {
  label: "Explore Explore 1387"
  description: "Comprehensive analytics explore joining base view_04162 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_04162
  
  always_filter: {
    filters: [view_04162.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04162.created_at_date: "7 days"]
    unless: [view_04162.id, view_04162.status]
  }

  join: view_04164 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04162.user_id} = ${view_04164.id} ;;
    required_joins: []
  }

  join: view_04165 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04162.account_id} = ${view_04165.account_id} ;;
    required_joins: [view_04164]
  }

  join: view_04166 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04162.category} = ${view_04166.category} ;;
  }

  access_filter: {
    field: view_04162.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04162.is_deleted} = false ;;
}
