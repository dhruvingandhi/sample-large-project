# Explore: explore_3786
# Auto-generated LookML Explore File

include: "/views/domain_09/view_11359.view.lkml"
include: "/views/domain_11/view_11361.view.lkml"
include: "/views/domain_12/view_11362.view.lkml"
include: "/views/domain_13/view_11363.view.lkml"

explore: explore_3786 {
  label: "Explore Explore 3786"
  description: "Comprehensive analytics explore joining base view_11359 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_11359
  
  always_filter: {
    filters: [view_11359.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11359.created_at_date: "7 days"]
    unless: [view_11359.id, view_11359.status]
  }

  join: view_11361 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11359.user_id} = ${view_11361.id} ;;
    required_joins: []
  }

  join: view_11362 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11359.account_id} = ${view_11362.account_id} ;;
    required_joins: [view_11361]
  }

  join: view_11363 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11359.category} = ${view_11363.category} ;;
  }

  access_filter: {
    field: view_11359.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11359.is_deleted} = false ;;
}
