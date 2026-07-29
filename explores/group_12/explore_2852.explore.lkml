# Explore: explore_2852
# Auto-generated LookML Explore File

include: "/views/domain_07/view_08557.view.lkml"
include: "/views/domain_09/view_08559.view.lkml"
include: "/views/domain_10/view_08560.view.lkml"
include: "/views/domain_11/view_08561.view.lkml"

explore: explore_2852 {
  label: "Explore Explore 2852"
  description: "Comprehensive analytics explore joining base view_08557 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_08557
  
  always_filter: {
    filters: [view_08557.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08557.created_at_date: "7 days"]
    unless: [view_08557.id, view_08557.status]
  }

  join: view_08559 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08557.user_id} = ${view_08559.id} ;;
    required_joins: []
  }

  join: view_08560 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08557.account_id} = ${view_08560.account_id} ;;
    required_joins: [view_08559]
  }

  join: view_08561 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08557.category} = ${view_08561.category} ;;
  }

  access_filter: {
    field: view_08557.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08557.is_deleted} = false ;;
}
