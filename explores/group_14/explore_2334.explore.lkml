# Explore: explore_2334
# Auto-generated LookML Explore File

include: "/views/domain_03/view_07003.view.lkml"
include: "/views/domain_05/view_07005.view.lkml"
include: "/views/domain_06/view_07006.view.lkml"
include: "/views/domain_07/view_07007.view.lkml"

explore: explore_2334 {
  label: "Explore Explore 2334"
  description: "Comprehensive analytics explore joining base view_07003 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_07003
  
  always_filter: {
    filters: [view_07003.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07003.created_at_date: "7 days"]
    unless: [view_07003.id, view_07003.status]
  }

  join: view_07005 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07003.user_id} = ${view_07005.id} ;;
    required_joins: []
  }

  join: view_07006 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07003.account_id} = ${view_07006.account_id} ;;
    required_joins: [view_07005]
  }

  join: view_07007 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07003.category} = ${view_07007.category} ;;
  }

  access_filter: {
    field: view_07003.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07003.is_deleted} = false ;;
}
