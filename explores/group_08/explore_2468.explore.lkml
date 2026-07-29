# Explore: explore_2468
# Auto-generated LookML Explore File

include: "/views/domain_05/view_07405.view.lkml"
include: "/views/domain_07/view_07407.view.lkml"
include: "/views/domain_08/view_07408.view.lkml"
include: "/views/domain_09/view_07409.view.lkml"

explore: explore_2468 {
  label: "Explore Explore 2468"
  description: "Comprehensive analytics explore joining base view_07405 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_07405
  
  always_filter: {
    filters: [view_07405.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07405.created_at_date: "7 days"]
    unless: [view_07405.id, view_07405.status]
  }

  join: view_07407 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07405.user_id} = ${view_07407.id} ;;
    required_joins: []
  }

  join: view_07408 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07405.account_id} = ${view_07408.account_id} ;;
    required_joins: [view_07407]
  }

  join: view_07409 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07405.category} = ${view_07409.category} ;;
  }

  access_filter: {
    field: view_07405.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07405.is_deleted} = false ;;
}
