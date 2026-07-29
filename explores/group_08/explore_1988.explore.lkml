# Explore: explore_1988
# Auto-generated LookML Explore File

include: "/views/domain_15/view_05965.view.lkml"
include: "/views/domain_17/view_05967.view.lkml"
include: "/views/domain_18/view_05968.view.lkml"
include: "/views/domain_19/view_05969.view.lkml"

explore: explore_1988 {
  label: "Explore Explore 1988"
  description: "Comprehensive analytics explore joining base view_05965 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_05965
  
  always_filter: {
    filters: [view_05965.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05965.created_at_date: "7 days"]
    unless: [view_05965.id, view_05965.status]
  }

  join: view_05967 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05965.user_id} = ${view_05967.id} ;;
    required_joins: []
  }

  join: view_05968 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05965.account_id} = ${view_05968.account_id} ;;
    required_joins: [view_05967]
  }

  join: view_05969 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05965.category} = ${view_05969.category} ;;
  }

  access_filter: {
    field: view_05965.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05965.is_deleted} = false ;;
}
