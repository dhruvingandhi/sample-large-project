# Explore: explore_2335
# Auto-generated LookML Explore File

include: "/views/domain_06/view_07006.view.lkml"
include: "/views/domain_08/view_07008.view.lkml"
include: "/views/domain_09/view_07009.view.lkml"
include: "/views/domain_10/view_07010.view.lkml"

explore: explore_2335 {
  label: "Explore Explore 2335"
  description: "Comprehensive analytics explore joining base view_07006 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_07006
  
  always_filter: {
    filters: [view_07006.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07006.created_at_date: "7 days"]
    unless: [view_07006.id, view_07006.status]
  }

  join: view_07008 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07006.user_id} = ${view_07008.id} ;;
    required_joins: []
  }

  join: view_07009 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07006.account_id} = ${view_07009.account_id} ;;
    required_joins: [view_07008]
  }

  join: view_07010 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07006.category} = ${view_07010.category} ;;
  }

  access_filter: {
    field: view_07006.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07006.is_deleted} = false ;;
}
