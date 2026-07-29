# Explore: explore_3902
# Auto-generated LookML Explore File

include: "/views/domain_07/view_11707.view.lkml"
include: "/views/domain_09/view_11709.view.lkml"
include: "/views/domain_10/view_11710.view.lkml"
include: "/views/domain_11/view_11711.view.lkml"

explore: explore_3902 {
  label: "Explore Explore 3902"
  description: "Comprehensive analytics explore joining base view_11707 with related tables."
  group_label: "Analytics Domain 03"
  
  view_name: view_11707
  
  always_filter: {
    filters: [view_11707.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11707.created_at_date: "7 days"]
    unless: [view_11707.id, view_11707.status]
  }

  join: view_11709 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11707.user_id} = ${view_11709.id} ;;
    required_joins: []
  }

  join: view_11710 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11707.account_id} = ${view_11710.account_id} ;;
    required_joins: [view_11709]
  }

  join: view_11711 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11707.category} = ${view_11711.category} ;;
  }

  access_filter: {
    field: view_11707.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11707.is_deleted} = false ;;
}
