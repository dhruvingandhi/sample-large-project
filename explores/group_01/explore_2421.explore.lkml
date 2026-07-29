# Explore: explore_2421
# Auto-generated LookML Explore File

include: "/views/domain_14/view_07264.view.lkml"
include: "/views/domain_16/view_07266.view.lkml"
include: "/views/domain_17/view_07267.view.lkml"
include: "/views/domain_18/view_07268.view.lkml"

explore: explore_2421 {
  label: "Explore Explore 2421"
  description: "Comprehensive analytics explore joining base view_07264 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07264
  
  always_filter: {
    filters: [view_07264.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07264.created_at_date: "7 days"]
    unless: [view_07264.id, view_07264.status]
  }

  join: view_07266 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07264.user_id} = ${view_07266.id} ;;
    required_joins: []
  }

  join: view_07267 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07264.account_id} = ${view_07267.account_id} ;;
    required_joins: [view_07266]
  }

  join: view_07268 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07264.category} = ${view_07268.category} ;;
  }

  access_filter: {
    field: view_07264.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07264.is_deleted} = false ;;
}
