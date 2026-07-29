# Explore: explore_3988
# Auto-generated LookML Explore File

include: "/views/domain_15/view_11965.view.lkml"
include: "/views/domain_17/view_11967.view.lkml"
include: "/views/domain_18/view_11968.view.lkml"
include: "/views/domain_19/view_11969.view.lkml"

explore: explore_3988 {
  label: "Explore Explore 3988"
  description: "Comprehensive analytics explore joining base view_11965 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_11965
  
  always_filter: {
    filters: [view_11965.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11965.created_at_date: "7 days"]
    unless: [view_11965.id, view_11965.status]
  }

  join: view_11967 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11965.user_id} = ${view_11967.id} ;;
    required_joins: []
  }

  join: view_11968 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11965.account_id} = ${view_11968.account_id} ;;
    required_joins: [view_11967]
  }

  join: view_11969 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11965.category} = ${view_11969.category} ;;
  }

  access_filter: {
    field: view_11965.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11965.is_deleted} = false ;;
}
