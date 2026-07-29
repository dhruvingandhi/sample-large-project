# Explore: explore_0421
# Auto-generated LookML Explore File

include: "/views/domain_14/view_01264.view.lkml"
include: "/views/domain_16/view_01266.view.lkml"
include: "/views/domain_17/view_01267.view.lkml"
include: "/views/domain_18/view_01268.view.lkml"

explore: explore_0421 {
  label: "Explore Explore 0421"
  description: "Comprehensive analytics explore joining base view_01264 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_01264
  
  always_filter: {
    filters: [view_01264.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01264.created_at_date: "7 days"]
    unless: [view_01264.id, view_01264.status]
  }

  join: view_01266 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01264.user_id} = ${view_01266.id} ;;
    required_joins: []
  }

  join: view_01267 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01264.account_id} = ${view_01267.account_id} ;;
    required_joins: [view_01266]
  }

  join: view_01268 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01264.category} = ${view_01268.category} ;;
  }

  access_filter: {
    field: view_01264.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01264.is_deleted} = false ;;
}
