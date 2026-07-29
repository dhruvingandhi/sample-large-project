# Explore: explore_3301
# Auto-generated LookML Explore File

include: "/views/domain_04/view_09904.view.lkml"
include: "/views/domain_06/view_09906.view.lkml"
include: "/views/domain_07/view_09907.view.lkml"
include: "/views/domain_08/view_09908.view.lkml"

explore: explore_3301 {
  label: "Explore Explore 3301"
  description: "Comprehensive analytics explore joining base view_09904 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09904
  
  always_filter: {
    filters: [view_09904.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09904.created_at_date: "7 days"]
    unless: [view_09904.id, view_09904.status]
  }

  join: view_09906 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09904.user_id} = ${view_09906.id} ;;
    required_joins: []
  }

  join: view_09907 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09904.account_id} = ${view_09907.account_id} ;;
    required_joins: [view_09906]
  }

  join: view_09908 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09904.category} = ${view_09908.category} ;;
  }

  access_filter: {
    field: view_09904.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09904.is_deleted} = false ;;
}
