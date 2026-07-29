# Explore: explore_1852
# Auto-generated LookML Explore File

include: "/views/domain_07/view_05557.view.lkml"
include: "/views/domain_09/view_05559.view.lkml"
include: "/views/domain_10/view_05560.view.lkml"
include: "/views/domain_11/view_05561.view.lkml"

explore: explore_1852 {
  label: "Explore Explore 1852"
  description: "Comprehensive analytics explore joining base view_05557 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_05557
  
  always_filter: {
    filters: [view_05557.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05557.created_at_date: "7 days"]
    unless: [view_05557.id, view_05557.status]
  }

  join: view_05559 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05557.user_id} = ${view_05559.id} ;;
    required_joins: []
  }

  join: view_05560 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05557.account_id} = ${view_05560.account_id} ;;
    required_joins: [view_05559]
  }

  join: view_05561 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05557.category} = ${view_05561.category} ;;
  }

  access_filter: {
    field: view_05557.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05557.is_deleted} = false ;;
}
