# Explore: explore_3317
# Auto-generated LookML Explore File

include: "/views/domain_02/view_09952.view.lkml"
include: "/views/domain_04/view_09954.view.lkml"
include: "/views/domain_05/view_09955.view.lkml"
include: "/views/domain_06/view_09956.view.lkml"

explore: explore_3317 {
  label: "Explore Explore 3317"
  description: "Comprehensive analytics explore joining base view_09952 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_09952
  
  always_filter: {
    filters: [view_09952.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09952.created_at_date: "7 days"]
    unless: [view_09952.id, view_09952.status]
  }

  join: view_09954 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09952.user_id} = ${view_09954.id} ;;
    required_joins: []
  }

  join: view_09955 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09952.account_id} = ${view_09955.account_id} ;;
    required_joins: [view_09954]
  }

  join: view_09956 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09952.category} = ${view_09956.category} ;;
  }

  access_filter: {
    field: view_09952.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09952.is_deleted} = false ;;
}
