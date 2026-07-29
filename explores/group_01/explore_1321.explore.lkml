# Explore: explore_1321
# Auto-generated LookML Explore File

include: "/views/domain_14/view_03964.view.lkml"
include: "/views/domain_16/view_03966.view.lkml"
include: "/views/domain_17/view_03967.view.lkml"
include: "/views/domain_18/view_03968.view.lkml"

explore: explore_1321 {
  label: "Explore Explore 1321"
  description: "Comprehensive analytics explore joining base view_03964 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03964
  
  always_filter: {
    filters: [view_03964.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03964.created_at_date: "7 days"]
    unless: [view_03964.id, view_03964.status]
  }

  join: view_03966 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03964.user_id} = ${view_03966.id} ;;
    required_joins: []
  }

  join: view_03967 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03964.account_id} = ${view_03967.account_id} ;;
    required_joins: [view_03966]
  }

  join: view_03968 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03964.category} = ${view_03968.category} ;;
  }

  access_filter: {
    field: view_03964.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03964.is_deleted} = false ;;
}
