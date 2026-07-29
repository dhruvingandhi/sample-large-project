# Explore: explore_2317
# Auto-generated LookML Explore File

include: "/views/domain_02/view_06952.view.lkml"
include: "/views/domain_04/view_06954.view.lkml"
include: "/views/domain_05/view_06955.view.lkml"
include: "/views/domain_06/view_06956.view.lkml"

explore: explore_2317 {
  label: "Explore Explore 2317"
  description: "Comprehensive analytics explore joining base view_06952 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_06952
  
  always_filter: {
    filters: [view_06952.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06952.created_at_date: "7 days"]
    unless: [view_06952.id, view_06952.status]
  }

  join: view_06954 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06952.user_id} = ${view_06954.id} ;;
    required_joins: []
  }

  join: view_06955 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06952.account_id} = ${view_06955.account_id} ;;
    required_joins: [view_06954]
  }

  join: view_06956 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06952.category} = ${view_06956.category} ;;
  }

  access_filter: {
    field: view_06952.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06952.is_deleted} = false ;;
}
