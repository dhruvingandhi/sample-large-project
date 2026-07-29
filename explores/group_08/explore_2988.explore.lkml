# Explore: explore_2988
# Auto-generated LookML Explore File

include: "/views/domain_15/view_08965.view.lkml"
include: "/views/domain_17/view_08967.view.lkml"
include: "/views/domain_18/view_08968.view.lkml"
include: "/views/domain_19/view_08969.view.lkml"

explore: explore_2988 {
  label: "Explore Explore 2988"
  description: "Comprehensive analytics explore joining base view_08965 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08965
  
  always_filter: {
    filters: [view_08965.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08965.created_at_date: "7 days"]
    unless: [view_08965.id, view_08965.status]
  }

  join: view_08967 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08965.user_id} = ${view_08967.id} ;;
    required_joins: []
  }

  join: view_08968 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08965.account_id} = ${view_08968.account_id} ;;
    required_joins: [view_08967]
  }

  join: view_08969 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08965.category} = ${view_08969.category} ;;
  }

  access_filter: {
    field: view_08965.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08965.is_deleted} = false ;;
}
