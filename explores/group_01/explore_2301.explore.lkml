# Explore: explore_2301
# Auto-generated LookML Explore File

include: "/views/domain_04/view_06904.view.lkml"
include: "/views/domain_06/view_06906.view.lkml"
include: "/views/domain_07/view_06907.view.lkml"
include: "/views/domain_08/view_06908.view.lkml"

explore: explore_2301 {
  label: "Explore Explore 2301"
  description: "Comprehensive analytics explore joining base view_06904 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_06904
  
  always_filter: {
    filters: [view_06904.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06904.created_at_date: "7 days"]
    unless: [view_06904.id, view_06904.status]
  }

  join: view_06906 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06904.user_id} = ${view_06906.id} ;;
    required_joins: []
  }

  join: view_06907 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06904.account_id} = ${view_06907.account_id} ;;
    required_joins: [view_06906]
  }

  join: view_06908 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06904.category} = ${view_06908.category} ;;
  }

  access_filter: {
    field: view_06904.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06904.is_deleted} = false ;;
}
