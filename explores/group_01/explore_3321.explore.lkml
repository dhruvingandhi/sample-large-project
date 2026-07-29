# Explore: explore_3321
# Auto-generated LookML Explore File

include: "/views/domain_14/view_09964.view.lkml"
include: "/views/domain_16/view_09966.view.lkml"
include: "/views/domain_17/view_09967.view.lkml"
include: "/views/domain_18/view_09968.view.lkml"

explore: explore_3321 {
  label: "Explore Explore 3321"
  description: "Comprehensive analytics explore joining base view_09964 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09964
  
  always_filter: {
    filters: [view_09964.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09964.created_at_date: "7 days"]
    unless: [view_09964.id, view_09964.status]
  }

  join: view_09966 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09964.user_id} = ${view_09966.id} ;;
    required_joins: []
  }

  join: view_09967 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09964.account_id} = ${view_09967.account_id} ;;
    required_joins: [view_09966]
  }

  join: view_09968 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09964.category} = ${view_09968.category} ;;
  }

  access_filter: {
    field: view_09964.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09964.is_deleted} = false ;;
}
